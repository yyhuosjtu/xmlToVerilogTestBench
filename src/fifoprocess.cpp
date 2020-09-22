#include <fstream> 
#include "fifoprocess.h"
#include "filedefine.h"

FIFOPROCESS::FIFOPROCESS() {
	_index = 0;
};

FIFOPROCESS::~FIFOPROCESS() {};

void FIFOPROCESS::fifoPortCout() {
	ofstream ofs;
	ofs.open(OUTPUTADDR, ios::app);
	ofs << "//fifo" << _index << "输出端口定义" << endl;
	ofs << "  wire [35:0] Fifo" << _index << "_data_r;" << endl;
	ofs << "  wire Fifo_" << _index << "_bp;" << endl;
	ofs << "//end fifo" << _index << "端口定义" << endl;
	ofs << endl;
	ofs.close();
}

void FIFOPROCESS::fifoInstantiateCout() {
	ofstream ofs;
	ofs.open(OUTPUTADDR, ios::app);
	ofs << "//fifo" << _index << "例化" << endl;
	ofs << "FIFO    fifo" << _index << "(" << endl;
	ofs << "    .clk(clk)," << endl;
	ofs << "    .rst_n(rst)," << endl;
	if (intype == 0) {
		ofs << "    .data_w(PE" << _inport << "_Outport0)," << endl;
	}
	else if (intype == 1) {
		ofs << "    .data_w(Fifo" << _inport << "_data_r)," << endl;
	}
	if (_bpfrom.bptype == 0) {
		ofs << "    .r_en(Pre_PE" << _bpfrom.bpindex << "_Bp" << _bpfrom.bpport << ")," << endl;
	}
	else if (_bpfrom.bptype == 1) {
		ofs << "    .r_en(Fifo_" << _bpfrom.bpindex << "_bp)," << endl;
	}
	ofs << "    .data_r(Fifo_" << _index << "_data_r)," << endl;
	ofs << "    .bp(Fifo_" << _index << "_bp)" << endl;
	ofs << ");" << endl;
	ofs << "//end fifo" << _index << "例化" << endl;
	ofs << "    " << endl;
	ofs.close();
}