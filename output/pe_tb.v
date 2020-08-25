`timescale 1ns/1ps
module PE_tb();
  parameter CYCLE=10;
  reg clk;
  reg rst;
//pe0输出端口定义
  reg  [32:0]    PE0_Configure_Inport;
  wire [35:0]    PE0_Outport0;
  wire Pre_PE0_Bp0;
  wire Pre_PE0_Bp1;
  wire Pre_PE0_Bp2;
//end pe0 端口定义

//pe1输出端口定义
  reg  [32:0]    PE1_Configure_Inport;
  wire [35:0]    PE1_Outport0;
  wire Pre_PE1_Bp0;
  wire Pre_PE1_Bp1;
  wire Pre_PE1_Bp2;
//end pe1 端口定义

//pe2输出端口定义
  reg  [32:0]    PE2_Configure_Inport;
  wire [35:0]    PE2_Outport0;
  wire Pre_PE2_Bp0;
  wire Pre_PE2_Bp1;
  wire Pre_PE2_Bp2;
//end pe2 端口定义

//pe3输出端口定义
  reg  [32:0]    PE3_Configure_Inport;
  wire [35:0]    PE3_Outport0;
  wire Pre_PE3_Bp0;
  wire Pre_PE3_Bp1;
  wire Pre_PE3_Bp2;
//end pe3 端口定义

//pe200输出端口定义
  reg  [32:0]    PE200_Configure_Inport;
  wire [35:0]    PE200_Outport0;
  wire Pre_PE200_Bp0;
  wire Pre_PE200_Bp1;
  wire Pre_PE200_Bp2;
//end pe200 端口定义

//pe114输出端口定义
  reg  [32:0]    PE114_Configure_Inport;
  wire [35:0]    PE114_Outport0;
  wire Pre_PE114_Bp0;
  wire Pre_PE114_Bp1;
  wire Pre_PE114_Bp2;
//end pe114 端口定义

//pe0例化
PE_top  pe0_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(PE1_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE1_BP0),
    .Post_PE_Bp1(Pre_PE2_BP1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE0_Configure_Inport),
    .PE_Outport0(PE0_Outport0),
    .Pre_PE_Bp0(Pre_PE0_Bp0),
    .Pre_PE_Bp1(Pre_PE0_Bp1),
    .Pre_PE_Bp2(Pre_PE0_Bp2)
//end pe0 例化
    
//pe1例化
PE_top  pe1_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(PE0_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE0_BP0),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE1_Configure_Inport),
    .PE_Outport0(PE1_Outport0),
    .Pre_PE_Bp0(Pre_PE1_Bp0),
    .Pre_PE_Bp1(Pre_PE1_Bp1),
    .Pre_PE_Bp2(Pre_PE1_Bp2)
//end pe1 例化
    
//pe2例化
PE_top  pe2_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE0_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(1'b1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE2_Configure_Inport),
    .PE_Outport0(PE2_Outport0),
    .Pre_PE_Bp0(Pre_PE2_Bp0),
    .Pre_PE_Bp1(Pre_PE2_Bp1),
    .Pre_PE_Bp2(Pre_PE2_Bp2)
//end pe2 例化
    
//pe3例化
PE_top  pe3_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE114_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE200_BP0),
    .Post_PE_Bp1(Pre_PE114_BP0),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE3_Configure_Inport),
    .PE_Outport0(PE3_Outport0),
    .Pre_PE_Bp0(Pre_PE3_Bp0),
    .Pre_PE_Bp1(Pre_PE3_Bp1),
    .Pre_PE_Bp2(Pre_PE3_Bp2)
//end pe3 例化
    
//pe200例化
PE_top  pe200_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(PE3_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(1'b1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE200_Configure_Inport),
    .PE_Outport0(PE200_Outport0),
    .Pre_PE_Bp0(Pre_PE200_Bp0),
    .Pre_PE_Bp1(Pre_PE200_Bp1),
    .Pre_PE_Bp2(Pre_PE200_Bp2)
//end pe200 例化
    
//pe114例化
PE_top  pe114_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(PE3_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE3_BP1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE114_Configure_Inport),
    .PE_Outport0(PE114_Outport0),
    .Pre_PE_Bp0(Pre_PE114_Bp0),
    .Pre_PE_Bp1(Pre_PE114_Bp1),
    .Pre_PE_Bp2(Pre_PE114_Bp2)
//end pe114 例化
    
  initial begin
    rst <=1'b1;
    clk <=1'b0;
    PE0_Configure_Inport <={1'b1,7'b000_0000,3'b101,1'b1,,3'b101,4'b0110,2'b01,1'd1,4'd2,2'd0};
    PE1_Configure_Inport <={1'b1,7'b000_0000,3'b010,1'b1,,3'b010,4'b1001,2'b11,1'd1,4'd0,2'd0};
    PE2_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0011,2'b00,1'd1,4'd0,2'd0};
    PE3_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0011,2'b00,1'd1,4'd0,2'd0};
    PE200_Configure_Inport <={1'b1,7'b000_0000,3'b000,1'b1,5'd0,3'b000,4'b0010,2'b00,1'd1,4'd0,2'd0};
    PE114_Configure_Inport <={1'b1,7'b000_0000,3'b000,1'b1,5'd0,3'b000,4'b0010,2'b00,1'd1,4'd0,2'd0};
    #2 rst <= ~rst;
    #1 rst <= ~rst;
    #10 PE0_Configure_Inport <={1'b1,32'd1};
        PE1_Configure_Inport <={1'b1,32'd1};
        PE2_Configure_Inport <={1'b1,32'd1};
        PE3_Configure_Inport <={1'b1,32'd1};
    #20 PE0_Configure_Inport <={1'b1,32'd8};
  end
  always #(CYCLE/2) clk=~clk;
endmodule
