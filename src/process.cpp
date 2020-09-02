#pragma once

#include "process.h"

#include <fstream>
#include <iostream>

#include "enum_converter.h"
#include "enum_define.h"
#include "filedefine.h"
#include "map_define.h"
#include "peprocess.h"

#define TIMESCALE "`timescale 1ns/1ps"
// index, opcode,loop_control,branch_control, output_from,
// input_vec, reg_vec, manual_cord, buffer_mode, input_bypass,
// inbuffer_from,inport_mode,outport_mode,sync,outermost, key_cal

process::process() {}

process::process(string a) {
    _addr = a;
    Parsing();
    dfgCout();
}

process::~process() {}

bool process::isManualPlacement() { return _manual_placement; }

void process::dfgCout() {
    /**
     * 输出固定表头
     */
    ofstream ofs;
    ofs.open(OUTPUTADDR, ios::out);
    ofs << TIMESCALE << endl;
    ofs << "module PE_tb();" << endl;
    ofs << "  parameter CYCLE=10;" << endl;
    ofs << "  reg clk;" << endl;
    ofs << "  reg rst;" << endl;
    ofs << "\n" << endl;
    ofs << "  integer i;" << endl;
    ofs << "  integer filez;" << endl;
    ofs.close();
    /**
     * pe端口声明
     */
    for (int i = 0; i < _peGroup.size(); ++i) {
        _peGroup[i].pePortCout();
    }
    /**
     * pe例化
     */
    for (int i = 0; i < _peGroup.size(); ++i) {
        _peGroup[i].peInstantiateCout();
    }

    ofs.open(OUTPUTADDR, ios::app);
    ofs << "  initial begin" << endl;
    ofs << "    rst <=1'b1;" << endl;
    ofs << "    clk <=1'b0;" << endl;
    ofs.close();
    /**
     * 输出pe的配置
     */
    for (int i = 0; i < _peGroup.size(); ++i) {
        _peGroup[i].peConfigCout();
    }
    ofs.open(OUTPUTADDR, ios::app);
    ofs << "    #2 rst <= ~rst;" << endl;
    ofs << "    #1 rst <= ~rst;" << endl;
    ofs.close();
    /**
     *写入pe的reg数据
     */
    peRegInitial();

    peOutMostLoop();

    ofs.open(OUTPUTADDR, ios::app);
    ofs << "  end" << endl;
    ofs.close();

    //输出data到data_flow_rtl中。
    dataCout();
    
    ofs.open(OUTPUTADDR, ios::app);
    ofs << "  always #(CYCLE/2) clk=~clk;" << endl;
    ofs << "endmodule" << endl;
    ofs.close();
    std::cout << "testbench has been done!" << std::endl;
    std::cout << "the output is:" << std::endl;
    std::cout << OUTPUTADDR << std::endl;
}

void process::peOutMostLoop(){
    if (_outLoopNum.size()==0)
    {
        return;
    }
    ofstream ofs;
    ofs.open(OUTPUTADDR, ios::app);
    for (int i = 0; i < _outLoopNum.size(); ++i)
    {
        ofs<<"    #10 PE"<<_outLoopNum[i]<<"_Inport1 <= {4'b1100,32'd0};"<<endl;
    }
    for (int i = 0; i < _outLoopNum.size(); ++i)
    {
        ofs<<"    #10 PE"<<_outLoopNum[i]<<"_Inport1 <= {4'b0000,32'd0};"<<endl;
    }
    ofs.close();
}

void process::dataCout(){
    ofstream ofs;
    ofs.open(OUTPUTADDR, ios::app);
    ofs << "  initial begin" << endl;
    ofs << "      filez=$fopen(\"./data_flow_rtl\",\"w\");" << endl;
    ofs << "        for(i=0;i<100;i=i+1) begin" << endl;
    ofs << "            @(posedge clk);" << endl;
    ofs << "            #1" << endl;
    for (int i = 0; i < _peGroup.size(); ++i)
    {
        ofs << "            if(PE"<<_peGroup[i]._index<<"_Outport0[35:33]!=3'b000&&PE"<<_peGroup[i]._index<<"_Outport0[32]!=1'b1) begin" << endl;
        ofs << "                $fwrite(filez,\"PE"<<_peGroup[i]._index<<".vbl=%b,value=%d";
        //判断inbuffer与outbuffer是不是全部bypass，53与54位是buffer_bypass的配置，如果全部bypass，则需要加注释
        if (_peGroup[i]._config[53]=='1'&&_peGroup[i]._config[54]=='1')
        {
            ofs << "@clk %d is_all_comb\\n\",PE"<<_peGroup[i]._index<<"_Outport0[35:33],PE"<<_peGroup[i]._index<<"_Outport0[31:0],i);" << endl;
        }else{
            ofs << "@clk %d\\n\",PE"<<_peGroup[i]._index<<"_Outport0[35:33],PE"<<_peGroup[i]._index<<"_Outport0[31:0],i);" << endl;
        }
        ofs << "            end" << endl;        
    }
    ofs << "        end" << endl;
    ofs << "        #1 $fclose(filez);" << endl;
    ofs << "        $finish;" << endl;
    ofs << "    end" << endl;
    ofs << "\n" << endl;
    ofs.close();
}

/**
 * @DateTime 2020-07-16
 * @func  parse xml to node
 */
void process::Parsing() {
    XMLDocument doc;

    if (doc.LoadFile(_addr.c_str()) != tinyxml2::XML_SUCCESS) {
        cout << "load xml failed!!!" << endl;
        // load不成功
        //有可能是文件路径错误，也有可能是文件格式错误
        return;
    }
    XMLElement* RootXml = doc.RootElement();
    // NOTE:与模拟器保持一致，留下接口
    _manual_placement =
        static_cast<string>(RootXml->FindAttribute("manual_placement")->Value()) == string("true");

    XMLElement* NodeXml = RootXml->FirstChildElement("node");

    while (NodeXml) {
        NodeType node_type = NodeTypeConverter::toEnum(NodeXml->FindAttribute("type")->Value());

        switch (node_type) {
            case NodeType::pe: {
                PEPROCESS pe;
                peparsing(NodeXml, &pe);
                _peGroup.push_back(pe);
                break;
            }
            case NodeType::bus: {
                break;
            }
            case NodeType::fg: {
                break;
            }
            case NodeType::ls: {
                /**
                 *只需要判断load或者l2p
                 */
                string lsmode = NodeXml->FindAttribute("ls_mode")->Value();
                if (lsmode == "load" || lsmode == "l2p" || lsmode == "dummy") {
                    PEPROCESS pe;
                    tempLsProcess(NodeXml, &pe);
                    _peGroup.push_back(pe);
                }
                break;
            }
            case NodeType::lv: {
                break;
            }
            case NodeType::lc: {
                break;
            }
            case NodeType::fifo: {
                PEPROCESS pe;
                tempFifoProcess(NodeXml, &pe);
                _peGroup.push_back(pe);
                break;
            }
            default:
                break;
        }
        NodeXml = NodeXml->NextSiblingElement("node");
    }

    for (int i = 0; i < _peBPTtc_i.size(); ++i) {
        _peBPItc[_peBPTtc_i[i].index].push_back({_peBPTtc_i[i].myindex, _peBPTtc_i[i].port});
    }


    for (int i = 0; i < _peGroup.size(); ++i) {
        int index = _peGroup[i]._index;
        for (int j = 0; j < _peBPItc[index].size(); ++j) {
            int bpindex            = _peBPItc[index][j].index;
            int bpport             = _peBPItc[index][j].port;
            _peGroup[i]._bpFrom[j] = {bpindex, bpport};
        }
    }
}

void process::peparsing(XMLElement* PeXml, PEPROCESS* pe) {
    pe->_index  = std::stoi(PeXml->FindAttribute("index")->Value());
    pe->_config = pecfggen(PeXml, pe);
}

/**
 * @Author   hlk
 * @DateTime 2020-07-16
 * @version  [version]
 * @param    PeXml      [pe单个节点的xml]
 * @return              [pe配置字的字符串，如PE_Configure <=
 * {1'b0,5'd13,3'b000,4'b1011,2'b00,1'b0,4'b0000,2'b11}]
 */
string process::pecfggen(XMLElement* PeXml, PEPROCESS* pe) {
    // TODO:加入bus后需要更改inport0_valid的输出值，现在默认为1'b0;
    string inport0_valid = "1'b1";
    string reser         = "1'b1,7'b000_0000";

    /****************************************生成pe是否需要写入值的配置*****************************************/
    XMLElement* reg_xml = PeXml->FirstChildElement("reg");
    string reg          = "3'b";
/*    for (int i = 0; i < 3; ++i) {
        if (reg_xml->FindAttribute("value")->Value() == string("null")) {
            reg += "0";
        } else {
            int value = std::stoi(reg_xml->FindAttribute("value")->Value());
            _regValue[pe->_index].push_back(value);
            reg += "1";
        }
        reg_xml = reg_xml->NextSiblingElement("reg");
    }*/
    while (reg_xml)
    {
        if (reg_xml->FindAttribute("value")->Value() == string("null")) {
            reg += "0";
        } else {
            int value = std::stoi(reg_xml->FindAttribute("value")->Value());
            _regValue[pe->_index].push_back(value);
            reg += "1";
        }
        reg_xml = reg_xml->NextSiblingElement("reg");
    }
    
    if(reg.size()!=6){
        if(reg=="3'b1")
            reg="3'b010";
        else if(reg=="3'b0")
            reg="3'b000";
    }

    //标识reg初始已经结束，直接输出PE0_Configure_Inport <= <=33'd0;
    _regValue[pe->_index].push_back(INT_MAX);

    //------------------------------------------------------------------------------------------//
    string alu = PEALUMAP[PeXml->FindAttribute("opcode")->Value()];

    XMLElement* inner_connection_xml = PeXml->FirstChildElement("inner_connection");

    /****************************************生成buf_mode****************************************/

    string buffer0_mode =
        PEBUFMODE[string(inner_connection_xml->FindAttribute("buffer0_mode")->Value())];
    string buffer1_mode = PEBUFMODE[inner_connection_xml->FindAttribute("buffer1_mode")->Value()];
    string buffer2_mode = PEBUFMODE[inner_connection_xml->FindAttribute("buffer2_mode")->Value()];

    string buf_mode = "3'b" + buffer0_mode + buffer1_mode + buffer2_mode;
    //------------------------------------------------------------------------------------------//
    //
    /****************************************生成buf_from****************************************/

    string buffer0_from =
        PEBUF02CFGMAP[inner_connection_xml->FindAttribute("buffer0_from")->Value()];
    string buffer1_from =
        PEBUF1CFGMAP[inner_connection_xml->FindAttribute("buffer1_from")->Value()];
    string buffer2_from =
        PEBUF02CFGMAP[inner_connection_xml->FindAttribute("buffer2_from")->Value()];

    string buf_from = "4'b" + buffer0_from + buffer1_from + buffer2_from;
    //-----------------------------------------------------------------------------------------//

    /****************************************生成bypass*****************************************/

    string inbuffer_bypass =
        PEBUFBYPASS[inner_connection_xml->FindAttribute("input_buffer_bypass")->Value()];
    string outbuffer_bypass =
        PEBUFBYPASS[inner_connection_xml->FindAttribute("output_buffer_bypass")->Value()];

    string buf_bypass = "2'b" + inbuffer_bypass + outbuffer_bypass;
    //------------------------------------------------------------------------------------------//

    /****************************************生成pe内部连线配置*****************************************/
    XMLElement* input_xml = PeXml->FirstChildElement("input");

    for (int i = 0; i < 3; ++i) {
        NodeType input_type = NodeTypeConverter::toEnum(input_xml->FindAttribute("type")->Value());
        if (input_type == NodeType::pe) {
            pe->_inport[i] = std::stoi(input_xml->FindAttribute("index")->Value());
            _peBPTtc_i.push_back({pe->_index, pe->_inport[i], i});
        }
        // NOTE:默认将ls_index加100，防止发生与pe的冲突
        else if (input_type == NodeType::ls) {
            pe->_inport[i] = std::stoi(input_xml->FindAttribute("index")->Value()) + 100;
            _peBPTtc_i.push_back({pe->_index, pe->_inport[i], i});
        }
        // NOTE:默认将fifo_index加100，防止发生与pe的冲突
        else if (input_type == NodeType::fifo) {
            pe->_inport[i] = std::stoi(input_xml->FindAttribute("index")->Value()) + 200;
            _peBPTtc_i.push_back({pe->_index, pe->_inport[i], i});
        }
        input_xml = input_xml->NextSiblingElement("input");
    }

    input_xml = PeXml->FirstChildElement("input");
    if ((string(input_xml->FindAttribute("type")->Value()) != "null") && ((string(inner_connection_xml->FindAttribute("buffer0_from")->Value()) == "null")&& (string(inner_connection_xml->FindAttribute("buffer1_from")->Value()) != "in0in1")))
        cout << pe->_index << " error" << endl;
    input_xml = input_xml->NextSiblingElement("input");
    if ((string(input_xml->FindAttribute("type")->Value()) != "null") && ((string(inner_connection_xml->FindAttribute("buffer1_from")->Value()) == "null")))
        cout << pe->_index << " error" << endl;
    input_xml = input_xml->NextSiblingElement("input");
    if ((string(input_xml->FindAttribute("type")->Value()) != "null") && ((string(inner_connection_xml->FindAttribute("buffer2_from")->Value()) == "null")))
        cout << pe->_index << " error" << endl;
    //------------------------------------------------------------------------------------------//


    /****************************************生成outmode*****************************************/
    // TODO:加入output_mode==bus时的配置，在xml中没找到对应的关键字配置，先默认为pe
    string outmode = "1'd0";
    //------------------------------------------------------------------------------------------//

    /****************************************生成control*****************************************/
    string str = PeXml->FindAttribute("loop_control")->Value();
    if (str =="outermost_loop")
    {
        pe->_outloop=true;
        _outLoopNum.push_back(pe->_index);
    }else{
        pe->_outloop=false;
    }
    string loop_control = PECTRMAP[str];
    //------------------------------------------------------------------------------------------//

    /****************************************生成branch_control***********************************/
    string branch_control;
    if (PeXml->FindAttribute("branch_control"))
        branch_control = BRANCHCONTROL[PeXml->FindAttribute("branch_control")->Value()];
    else
        branch_control = "2'd0";
    //------------------------------------------------------------------------------------------//

    string comma = ",";
    string pecfg = "{" + reser + comma + reg + comma + inport0_valid + comma + alu + comma +
                   buf_mode + comma + buf_from + comma + buf_bypass + comma + outmode + comma +
                   loop_control + comma + branch_control + "}";
    return pecfg;
}

void process::peRegInitial() {
    ofstream ofs;
    ofs.open(OUTPUTADDR, ios::app);

    unordered_map<int, vector<int>>::iterator iter;
    for (int i = 0; i < 3; ++i) {
        bool Timing = false;
        for (auto iter = _regValue.begin(); iter != _regValue.end(); ++iter) {
            if (i < iter->second.size()) {
                if (Timing) {
                    ofs << "        ";
                } else {
                    ofs << "    #10 ";
                }
                if (iter->second[i] == INT_MAX) {
                    ofs << "PE" << iter->first << "_Configure_Inport <=33'd0;" << endl;
                } else {
                    ofs << "PE" << iter->first << "_Configure_Inport <={1'b1,32'h";
                    ofs << hex<<iter->second[i] << "};" << endl;
                    ofs << dec;
                };
                Timing = true;
            }
        }
    }

    ofs.close();
}

/**
 * @Author   hlk
 * @DateTime 2020-07-19
 * @version  方便处理LSE的load模式，为了保持DFG的完整，对于store模式，可以直接忽略；
 *            对于load模式，将其转化为null模式的PE，为了保持之前代码的完整性，引入这个函数，
 *            到时候可以直接删除.默认ls的index为ls_index+100
 */
void process::tempLsProcess(XMLElement* PeXml, PEPROCESS* pe) {
    pe->_index  = std::stoi(PeXml->FindAttribute("index")->Value()) + 100;
    pe->_config = lscfggen(PeXml, pe);
}

string process::lscfggen(XMLElement* PeXml, PEPROCESS* pe) {

    string inport0_valid = "1'b1";
    string reser         = "1'b1,7'b000_0000";

    string alu = PEALUMAP["add"];

    /****************************************生成pe是否需要写入值的配置*****************************************/
    _regValue[pe->_index].push_back(0);
    _regValue[pe->_index].push_back(INT_MAX);

    /****************************************生成buf_mode****************************************/

    string buffer0_mode = PEBUFMODE["keep"];
    string buffer1_mode = PEBUFMODE["buffer"];
    string buffer2_mode = PEBUFMODE["buffer"];

    string buf_mode = "3'b" + buffer0_mode + buffer1_mode + buffer2_mode;
    //------------------------------------------------------------------------------------------//
    //
    /****************************************生成buf_from****************************************/

    string buffer0_from = PEBUF02CFGMAP["null"];
    string buffer1_from = PEBUF1CFGMAP["in1"];
    string buffer2_from = PEBUF02CFGMAP["null"];

    string buf_from = "4'b" + buffer0_from + buffer1_from + buffer2_from;
    //-----------------------------------------------------------------------------------------//

    /****************************************生成bypass*****************************************/

    string inbuffer_bypass  = PEBUFBYPASS["inbuffer"];
    string outbuffer_bypass = PEBUFBYPASS["outbuffer"];

    string buf_bypass = "2'b" + inbuffer_bypass + outbuffer_bypass;
    //------------------------------------------------------------------------------------------//

    /****************************************生成pe内部连线配置*****************************************/
    XMLElement* input_xml = PeXml->FirstChildElement("input");

    for (int i = 1; (input_xml != nullptr && i < 3); ++i) {
        NodeType input_type = NodeTypeConverter::toEnum(input_xml->FindAttribute("type")->Value());
        if (input_type == NodeType::pe) {
            pe->_inport[i] = std::stoi(input_xml->FindAttribute("index")->Value());
            _peBPTtc_i.push_back({pe->_index, pe->_inport[i], i});
        }
        else if (input_type == NodeType::ls) {
            pe->_inport[i] = std::stoi(input_xml->FindAttribute("index")->Value()) + 100;
            _peBPTtc_i.push_back({ pe->_index, pe->_inport[i], i });
        }
        else if (input_type == NodeType::fifo) {
            pe->_inport[i] = std::stoi(input_xml->FindAttribute("index")->Value()) + 200;
            _peBPTtc_i.push_back({ pe->_index, pe->_inport[i], i });
        }
        input_xml = input_xml->NextSiblingElement("input");
    }

    //------------------------------------------------------------------------------------------//


    /****************************************生成outmode*****************************************/
    string outmode = "1'd0";
    //------------------------------------------------------------------------------------------//

    /****************************************生成control*****************************************/
    string loop_control = PECTRMAP["null"];
    //------------------------------------------------------------------------------------------//

    /****************************************生成branch_control***********************************/
    string branch_control = BRANCHCONTROL["null"];
    //------------------------------------------------------------------------------------------//

    string comma = ",";
    string pecfg = "{" + reser + comma + "3'b100" + comma + inport0_valid + comma + alu + comma +
                   buf_mode + comma + buf_from + comma + buf_bypass + comma + outmode + comma +
                   loop_control + comma + branch_control + "}";
    return pecfg;
}

void process::tempFifoProcess(XMLElement* PeXml, PEPROCESS* pe){
    pe->_index  = std::stoi(PeXml->FindAttribute("index")->Value()) + 200;
    pe->_config = lscfggen(PeXml, pe);
}