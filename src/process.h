#pragma once

#include <iostream>
#include <unordered_map>
#include <vector>
#include "fifoprocess.h"
#include "enum_define.h"
#include "../lib/tinyxml2/tinyxml2.h"
#include "peprocess.h"
using namespace tinyxml2;
using namespace std;
// index, opcode,loop_control,branch_control, output_from,
// input_vec, reg_vec, manual_cord, buffer_mode, input_bypass,
// inbuffer_from,inport_mode,outport_mode,sync,outermost, key_cal

// bpInterconnection
struct bpItc {
    int type;
    int index;
    int port;
};

struct bpItc_i {
    int myindex;
    int mytype;
    int type;
    int index;
    int port;
};

class process {
   public:
    process();
    process(string a);

    ~process();

   public:
    bool isManualPlacement();

    // pe相关的处理函数
   private:
    void peparsing(XMLElement* PeXml, PEPROCESS* pe);
    void fifoparsing(XMLElement* FifoXml, FIFOPROCESS* fifo);
    string pecfggen(XMLElement* PeXml, PEPROCESS* pe);
    void peRegInitial();
    void peOutMostLoop();

    // ls,fifo等相关的临时处理函数
   private:
    void tempLsProcess(XMLElement* PeXml, PEPROCESS* pe);
    string lscfggen(XMLElement* PeXml, PEPROCESS* pe);
    void tempFifoProcess(XMLElement* PeXml, PEPROCESS* pe);
    void Fifocfggen(XMLElement* FifoXml, FIFOPROCESS* fifo);

   private:
    void dfgCout();

   private:
    string _addr;

    void dataCout();
    void Parsing();
    bool _manual_placement;
    //保存所有pe信息
    vector<PEPROCESS> _peGroup;
    //保存所有的连接关系格式为{当前pe，当前pe的输入数据来源类型，当前pe的数据来源编号，当前pe的端口};
    vector<bpItc_i> _BPTtc_i;
    unordered_map<int, vector<bpItc>> _peBPItc;
    unordered_map<int, bpItc> _fifoBPItc;
    //index + regvalue
    unordered_map<int, vector<int>> _regValue;
    //保存作为out_loop的编号
    std::vector<int> _outLoopNum;
    //保存所有fifo信息
    vector<FIFOPROCESS> _fifoGroup;
};