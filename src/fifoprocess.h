#pragma once

#include <iostream>
#include <string>

using namespace std;

struct FIFOBPPORT
{
	int bptype;
	int bpindex;
	int bpport;
};

class FIFOPROCESS {
public:
	FIFOPROCESS();
	~FIFOPROCESS();

public:
	void fifoPortCout();
	void fifoInstantiateCout();

public:
	int _index;
	int intype = 0;//0�����pe, 1�����fifo
	int _inport = 0;
	FIFOBPPORT _bpfrom = { 0, 0, 0 };
};
