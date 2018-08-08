/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            calc_frame.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef CALC_FRAME_SV
`define CALC_FRAME_SV
parameter DATA_WIDTH = 32;
parameter RESP_WIDTH = 2;
parameter CMD_WIDTH = 4;
class calc_frame extends uvm_sequence_item;
   rand bit[CMD_WIDTH - 1 : 0]   req1_cmd_in;
   rand bit[DATA_WIDTH - 1 : 0]  req1_data_in;
   rand bit[CMD_WIDTH - 1 : 0]   req2_cmd_in;
   rand bit[DATA_WIDTH - 1 : 0]  req2_data_in;
   rand bit[CMD_WIDTH - 1 : 0]   req3_cmd_in;
   rand bit[DATA_WIDTH - 1 : 0]  req3_data_in;
   rand bit[CMD_WIDTH - 1 : 0]   req4_cmd_in;
   rand bit[DATA_WIDTH - 1 : 0]  req4_data_in;
    `uvm_object_utils_begin(calc_frame)
       `uvm_field_int(req1_data_in, UVM_ALL_ON)
       `uvm_field_int(req1_cmd_in, UVM_ALL_ON)
       `uvm_field_int(req2_data_in, UVM_ALL_ON)
       `uvm_field_int(req2_cmd_in, UVM_ALL_ON)
       `uvm_field_int(req3_data_in, UVM_ALL_ON)
       `uvm_field_int(req3_cmd_in, UVM_ALL_ON)
       `uvm_field_int(req4_data_in, UVM_ALL_ON)
       `uvm_field_int(req4_cmd_in, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "calc_frame");
        super.new(name);
    endfunction // new
   constraint data_constraint {
      req1_data_in < 100;
      req2_data_in < 100;
      req3_data_in < 100;
      req4_data_in < 100;
   };

endclass : calc_frame

`endif

