`timescale 1ns/1ps
module PE_tb();
  parameter CYCLE=10;
  reg clk;
  reg rst;


  integer i;
  integer filez;
//pe1输出端口定义
  reg  [35:0]    PE1_Inport1;
  reg  [32:0]    PE1_Configure_Inport;
  wire [35:0]    PE1_Outport0;
  wire Pre_PE1_Bp0;
  wire Pre_PE1_Bp1;
  wire Pre_PE1_Bp2;
//end pe1 端口定义

//pe4输出端口定义
  reg  [32:0]    PE4_Configure_Inport;
  wire [35:0]    PE4_Outport0;
  wire Pre_PE4_Bp0;
  wire Pre_PE4_Bp1;
  wire Pre_PE4_Bp2;
//end pe4 端口定义

//pe39输出端口定义
  reg  [32:0]    PE39_Configure_Inport;
  wire [35:0]    PE39_Outport0;
  wire Pre_PE39_Bp0;
  wire Pre_PE39_Bp1;
  wire Pre_PE39_Bp2;
//end pe39 端口定义

//pe5输出端口定义
  reg  [32:0]    PE5_Configure_Inport;
  wire [35:0]    PE5_Outport0;
  wire Pre_PE5_Bp0;
  wire Pre_PE5_Bp1;
  wire Pre_PE5_Bp2;
//end pe5 端口定义

//pe7输出端口定义
  reg  [32:0]    PE7_Configure_Inport;
  wire [35:0]    PE7_Outport0;
  wire Pre_PE7_Bp0;
  wire Pre_PE7_Bp1;
  wire Pre_PE7_Bp2;
//end pe7 端口定义

//pe10输出端口定义
  reg  [32:0]    PE10_Configure_Inport;
  wire [35:0]    PE10_Outport0;
  wire Pre_PE10_Bp0;
  wire Pre_PE10_Bp1;
  wire Pre_PE10_Bp2;
//end pe10 端口定义

//pe26输出端口定义
  reg  [32:0]    PE26_Configure_Inport;
  wire [35:0]    PE26_Outport0;
  wire Pre_PE26_Bp0;
  wire Pre_PE26_Bp1;
  wire Pre_PE26_Bp2;
//end pe26 端口定义

//pe27输出端口定义
  reg  [32:0]    PE27_Configure_Inport;
  wire [35:0]    PE27_Outport0;
  wire Pre_PE27_Bp0;
  wire Pre_PE27_Bp1;
  wire Pre_PE27_Bp2;
//end pe27 端口定义

//pe40输出端口定义
  reg  [32:0]    PE40_Configure_Inport;
  wire [35:0]    PE40_Outport0;
  wire Pre_PE40_Bp0;
  wire Pre_PE40_Bp1;
  wire Pre_PE40_Bp2;
//end pe40 端口定义

//pe28输出端口定义
  reg  [32:0]    PE28_Configure_Inport;
  wire [35:0]    PE28_Outport0;
  wire Pre_PE28_Bp0;
  wire Pre_PE28_Bp1;
  wire Pre_PE28_Bp2;
//end pe28 端口定义

//pe29输出端口定义
  reg  [32:0]    PE29_Configure_Inport;
  wire [35:0]    PE29_Outport0;
  wire Pre_PE29_Bp0;
  wire Pre_PE29_Bp1;
  wire Pre_PE29_Bp2;
//end pe29 端口定义

//pe30输出端口定义
  reg  [32:0]    PE30_Configure_Inport;
  wire [35:0]    PE30_Outport0;
  wire Pre_PE30_Bp0;
  wire Pre_PE30_Bp1;
  wire Pre_PE30_Bp2;
//end pe30 端口定义

//pe118输出端口定义
  reg  [32:0]    PE118_Configure_Inport;
  wire [35:0]    PE118_Outport0;
  wire Pre_PE118_Bp0;
  wire Pre_PE118_Bp1;
  wire Pre_PE118_Bp2;
//end pe118 端口定义

//pe119输出端口定义
  reg  [32:0]    PE119_Configure_Inport;
  wire [35:0]    PE119_Outport0;
  wire Pre_PE119_Bp0;
  wire Pre_PE119_Bp1;
  wire Pre_PE119_Bp2;
//end pe119 端口定义

//pe138输出端口定义
  reg  [32:0]    PE138_Configure_Inport;
  wire [35:0]    PE138_Outport0;
  wire Pre_PE138_Bp0;
  wire Pre_PE138_Bp1;
  wire Pre_PE138_Bp2;
//end pe138 端口定义

//pe139输出端口定义
  reg  [32:0]    PE139_Configure_Inport;
  wire [35:0]    PE139_Outport0;
  wire Pre_PE139_Bp0;
  wire Pre_PE139_Bp1;
  wire Pre_PE139_Bp2;
//end pe139 端口定义

//pe1例化
PE_top  pe1_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE1_Inport1),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE4_Bp1),
    .Post_PE_Bp1(Pre_PE39_Bp2),
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
);
//end pe1 例化
    
//pe4例化
PE_top  pe4_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE1_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE5_Bp2),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE4_Configure_Inport),
    .PE_Outport0(PE4_Outport0),
    .Pre_PE_Bp0(Pre_PE4_Bp0),
    .Pre_PE_Bp1(Pre_PE4_Bp1),
    .Pre_PE_Bp2(Pre_PE4_Bp2)
);
//end pe4 例化
    
//pe39例化
PE_top  pe39_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(36'b0),
    .PE_Inport2(PE1_Outport0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE5_Bp1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE39_Configure_Inport),
    .PE_Outport0(PE39_Outport0),
    .Pre_PE_Bp0(Pre_PE39_Bp0),
    .Pre_PE_Bp1(Pre_PE39_Bp1),
    .Pre_PE_Bp2(Pre_PE39_Bp2)
);
//end pe39 例化
    
//pe5例化
PE_top  pe5_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE39_Outport0),
    .PE_Inport2(PE4_Outport0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE7_Bp1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE5_Configure_Inport),
    .PE_Outport0(PE5_Outport0),
    .Pre_PE_Bp0(Pre_PE5_Bp0),
    .Pre_PE_Bp1(Pre_PE5_Bp1),
    .Pre_PE_Bp2(Pre_PE5_Bp2)
);
//end pe5 例化
    
//pe7例化
PE_top  pe7_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE5_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE10_Bp0),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE7_Configure_Inport),
    .PE_Outport0(PE7_Outport0),
    .Pre_PE_Bp0(Pre_PE7_Bp0),
    .Pre_PE_Bp1(Pre_PE7_Bp1),
    .Pre_PE_Bp2(Pre_PE7_Bp2)
);
//end pe7 例化
    
//pe10例化
PE_top  pe10_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(PE7_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE26_Bp1),
    .Post_PE_Bp1(Pre_PE27_Bp1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE10_Configure_Inport),
    .PE_Outport0(PE10_Outport0),
    .Pre_PE_Bp0(Pre_PE10_Bp0),
    .Pre_PE_Bp1(Pre_PE10_Bp1),
    .Pre_PE_Bp2(Pre_PE10_Bp2)
);
//end pe10 例化
    
//pe26例化
PE_top  pe26_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE10_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE118_Bp1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE26_Configure_Inport),
    .PE_Outport0(PE26_Outport0),
    .Pre_PE_Bp0(Pre_PE26_Bp0),
    .Pre_PE_Bp1(Pre_PE26_Bp1),
    .Pre_PE_Bp2(Pre_PE26_Bp2)
);
//end pe26 例化
    
//pe27例化
PE_top  pe27_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE10_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE40_Bp0),
    .Post_PE_Bp1(Pre_PE119_Bp1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE27_Configure_Inport),
    .PE_Outport0(PE27_Outport0),
    .Pre_PE_Bp0(Pre_PE27_Bp0),
    .Pre_PE_Bp1(Pre_PE27_Bp1),
    .Pre_PE_Bp2(Pre_PE27_Bp2)
);
//end pe27 例化
    
//pe40例化
PE_top  pe40_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(PE27_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE28_Bp2),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE40_Configure_Inport),
    .PE_Outport0(PE40_Outport0),
    .Pre_PE_Bp0(Pre_PE40_Bp0),
    .Pre_PE_Bp1(Pre_PE40_Bp1),
    .Pre_PE_Bp2(Pre_PE40_Bp2)
);
//end pe40 例化
    
//pe28例化
PE_top  pe28_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(PE119_Outport0),
    .PE_Inport1(PE118_Outport0),
    .PE_Inport2(PE40_Outport0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE29_Bp2),
    .Post_PE_Bp1(Pre_PE30_Bp2),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE28_Configure_Inport),
    .PE_Outport0(PE28_Outport0),
    .Pre_PE_Bp0(Pre_PE28_Bp0),
    .Pre_PE_Bp1(Pre_PE28_Bp1),
    .Pre_PE_Bp2(Pre_PE28_Bp2)
);
//end pe28 例化
    
//pe29例化
PE_top  pe29_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE138_Outport0),
    .PE_Inport2(PE28_Outport0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(1'b1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE29_Configure_Inport),
    .PE_Outport0(PE29_Outport0),
    .Pre_PE_Bp0(Pre_PE29_Bp0),
    .Pre_PE_Bp1(Pre_PE29_Bp1),
    .Pre_PE_Bp2(Pre_PE29_Bp2)
);
//end pe29 例化
    
//pe30例化
PE_top  pe30_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE139_Outport0),
    .PE_Inport2(PE28_Outport0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(1'b1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE30_Configure_Inport),
    .PE_Outport0(PE30_Outport0),
    .Pre_PE_Bp0(Pre_PE30_Bp0),
    .Pre_PE_Bp1(Pre_PE30_Bp1),
    .Pre_PE_Bp2(Pre_PE30_Bp2)
);
//end pe30 例化
    
//pe118例化
PE_top  pe118_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE26_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE28_Bp1),
    .Post_PE_Bp1(Pre_PE138_Bp1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE118_Configure_Inport),
    .PE_Outport0(PE118_Outport0),
    .Pre_PE_Bp0(Pre_PE118_Bp0),
    .Pre_PE_Bp1(Pre_PE118_Bp1),
    .Pre_PE_Bp2(Pre_PE118_Bp2)
);
//end pe118 例化
    
//pe119例化
PE_top  pe119_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE27_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE28_Bp0),
    .Post_PE_Bp1(Pre_PE139_Bp1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE119_Configure_Inport),
    .PE_Outport0(PE119_Outport0),
    .Pre_PE_Bp0(Pre_PE119_Bp0),
    .Pre_PE_Bp1(Pre_PE119_Bp1),
    .Pre_PE_Bp2(Pre_PE119_Bp2)
);
//end pe119 例化
    
//pe138例化
PE_top  pe138_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE118_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE29_Bp1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE138_Configure_Inport),
    .PE_Outport0(PE138_Outport0),
    .Pre_PE_Bp0(Pre_PE138_Bp0),
    .Pre_PE_Bp1(Pre_PE138_Bp1),
    .Pre_PE_Bp2(Pre_PE138_Bp2)
);
//end pe138 例化
    
//pe139例化
PE_top  pe139_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE119_Outport0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE30_Bp1),
    .Post_PE_Bp1(1'b1),
    .Post_PE_Bp2(1'b1),
    .Post_PE_Bp3(1'b1),
    .Post_PE_Bp4(1'b1),
    .Post_PE_Bp5(1'b1),
    .Post_PE_Bp6(1'b1),
    .Post_PE_Bp7(1'b1),
    .PE_Configure_Inport(PE139_Configure_Inport),
    .PE_Outport0(PE139_Outport0),
    .Pre_PE_Bp0(Pre_PE139_Bp0),
    .Pre_PE_Bp1(Pre_PE139_Bp1),
    .Pre_PE_Bp2(Pre_PE139_Bp2)
);
//end pe139 例化
    
  initial begin
    rst <=1'b1;
    clk <=1'b0;
    PE1_Configure_Inport <={1'b1,7'b000_0000,3'b101,1'b1,5'd5,3'b101,4'b0100,2'b01,1'd0,4'd2,2'd0};
    PE4_Configure_Inport <={1'b1,7'b000_0000,3'b101,1'b1,5'd5,3'b101,4'b0100,2'b01,1'd0,4'd1,2'd0};
    PE39_Configure_Inport <={1'b1,7'b000_0000,3'b010,1'b1,5'd18,3'b000,4'b0101,2'b00,1'd0,4'd0,2'd0};
    PE5_Configure_Inport <={1'b1,7'b000_0000,3'b000,1'b1,5'd0,3'b010,4'b0011,2'b00,1'd0,4'd12,2'd0};
    PE7_Configure_Inport <={1'b1,7'b000_0000,3'b101,1'b1,5'd5,3'b101,4'b0100,2'b01,1'd0,4'd10,2'd0};
    PE10_Configure_Inport <={1'b1,7'b000_0000,3'b010,1'b1,5'd3,3'b010,4'b1000,2'b00,1'd0,4'd0,2'd0};
    PE26_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0010,2'b00,1'd0,4'd0,2'd0};
    PE27_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0010,2'b00,1'd0,4'd0,2'd0};
    PE40_Configure_Inport <={1'b1,7'b000_0000,3'b010,1'b1,5'd5,3'b010,4'b1000,2'b00,1'd0,4'd0,2'd0};
    PE28_Configure_Inport <={1'b1,7'b000_0000,3'b000,1'b1,5'd5,3'b000,4'b1011,2'b00,1'd0,4'd0,2'd1};
    PE29_Configure_Inport <={1'b1,7'b000_0000,3'b000,1'b1,5'd0,3'b000,4'b0011,2'b00,1'd0,4'd0,2'd1};
    PE30_Configure_Inport <={1'b1,7'b000_0000,3'b000,1'b1,5'd0,3'b000,4'b0011,2'b00,1'd0,4'd0,2'd1};
    PE118_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0010,2'b00,1'd0,4'd0,2'd0};
    PE119_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0010,2'b00,1'd0,4'd0,2'd0};
    PE138_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0010,2'b00,1'd0,4'd0,2'd0};
    PE139_Configure_Inport <={1'b1,7'b000_0000,3'b100,1'b1,5'd3,3'b100,4'b0010,2'b00,1'd0,4'd0,2'd0};
    #2 rst <= ~rst;
    #1 rst <= ~rst;
    #10 PE1_Configure_Inport <={1'b1,32'd0};
        PE4_Configure_Inport <={1'b1,32'd0};
        PE7_Configure_Inport <={1'b1,32'd2};
        PE39_Configure_Inport <={1'b1,32'd1};
        PE5_Configure_Inport <=33'd0;
        PE26_Configure_Inport <={1'b1,32'd32};
        PE138_Configure_Inport <={1'b1,32'd0};
        PE10_Configure_Inport <={1'b1,32'd64};
        PE27_Configure_Inport <={1'b1,32'd33};
        PE40_Configure_Inport <={1'b1,32'd128};
        PE28_Configure_Inport <=33'd0;
        PE29_Configure_Inport <=33'd0;
        PE30_Configure_Inport <=33'd0;
        PE118_Configure_Inport <={1'b1,32'd0};
        PE119_Configure_Inport <={1'b1,32'd0};
        PE139_Configure_Inport <={1'b1,32'd0};
    #10 PE1_Configure_Inport <={1'b1,32'd5};
        PE4_Configure_Inport <={1'b1,32'd2};
        PE7_Configure_Inport <={1'b1,32'd32};
        PE39_Configure_Inport <=33'd0;
        PE26_Configure_Inport <=33'd0;
        PE138_Configure_Inport <=33'd0;
        PE10_Configure_Inport <=33'd0;
        PE27_Configure_Inport <=33'd0;
        PE40_Configure_Inport <=33'd0;
        PE118_Configure_Inport <=33'd0;
        PE119_Configure_Inport <=33'd0;
        PE139_Configure_Inport <=33'd0;
    #10 PE1_Configure_Inport <=33'd0;
        PE4_Configure_Inport <=33'd0;
        PE7_Configure_Inport <=33'd0;
    #10 PE1_Inport1 <= {4'b1100,32'd0};
    #10 PE1_Inport1 <= {4'b0000,32'd0};
  end
  initial begin
      filez=$fopen("./data_flow_rtl","w");
        for(i=0;i<100;i=i+1) begin
            @(posedge clk);
            #1
            if(PE1_Outport0[35:33]!=3'b000&&PE1_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE1.vbl=%b,value=%d@clk %d\n",PE1_Outport0[35:33],PE1_Outport0[31:0],i);
            end
            if(PE4_Outport0[35:33]!=3'b000&&PE4_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE4.vbl=%b,value=%d@clk %d\n",PE4_Outport0[35:33],PE4_Outport0[31:0],i);
            end
            if(PE39_Outport0[35:33]!=3'b000&&PE39_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE39.vbl=%b,value=%d@clk %d\n",PE39_Outport0[35:33],PE39_Outport0[31:0],i);
            end
            if(PE5_Outport0[35:33]!=3'b000&&PE5_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE5.vbl=%b,value=%d@clk %d\n",PE5_Outport0[35:33],PE5_Outport0[31:0],i);
            end
            if(PE7_Outport0[35:33]!=3'b000&&PE7_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE7.vbl=%b,value=%d@clk %d\n",PE7_Outport0[35:33],PE7_Outport0[31:0],i);
            end
            if(PE10_Outport0[35:33]!=3'b000&&PE10_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE10.vbl=%b,value=%d@clk %d\n",PE10_Outport0[35:33],PE10_Outport0[31:0],i);
            end
            if(PE26_Outport0[35:33]!=3'b000&&PE26_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE26.vbl=%b,value=%d@clk %d\n",PE26_Outport0[35:33],PE26_Outport0[31:0],i);
            end
            if(PE27_Outport0[35:33]!=3'b000&&PE27_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE27.vbl=%b,value=%d@clk %d\n",PE27_Outport0[35:33],PE27_Outport0[31:0],i);
            end
            if(PE40_Outport0[35:33]!=3'b000&&PE40_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE40.vbl=%b,value=%d@clk %d\n",PE40_Outport0[35:33],PE40_Outport0[31:0],i);
            end
            if(PE28_Outport0[35:33]!=3'b000&&PE28_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE28.vbl=%b,value=%d@clk %d\n",PE28_Outport0[35:33],PE28_Outport0[31:0],i);
            end
            if(PE29_Outport0[35:33]!=3'b000&&PE29_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE29.vbl=%b,value=%d@clk %d\n",PE29_Outport0[35:33],PE29_Outport0[31:0],i);
            end
            if(PE30_Outport0[35:33]!=3'b000&&PE30_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE30.vbl=%b,value=%d@clk %d\n",PE30_Outport0[35:33],PE30_Outport0[31:0],i);
            end
            if(PE118_Outport0[35:33]!=3'b000&&PE118_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE118.vbl=%b,value=%d@clk %d\n",PE118_Outport0[35:33],PE118_Outport0[31:0],i);
            end
            if(PE119_Outport0[35:33]!=3'b000&&PE119_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE119.vbl=%b,value=%d@clk %d\n",PE119_Outport0[35:33],PE119_Outport0[31:0],i);
            end
            if(PE138_Outport0[35:33]!=3'b000&&PE138_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE138.vbl=%b,value=%d@clk %d\n",PE138_Outport0[35:33],PE138_Outport0[31:0],i);
            end
            if(PE139_Outport0[35:33]!=3'b000&&PE139_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE139.vbl=%b,value=%d@clk %d\n",PE139_Outport0[35:33],PE139_Outport0[31:0],i);
            end
        end
        #1 $fclose(filez);
        $finish;
    end


  always #(CYCLE/2) clk=~clk;
endmodule
