/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_frame.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef AXIL_FRAME_SV
 `define AXIL_FRAME_SV
parameter integer C_S00_AXI_DATA_WIDTH	= 32;
parameter integer C_S00_AXI_ADDR_WIDTH	= 4;

class axil_frame extends uvm_sequence_item;
   
   rand bit [C_S00_AXI_ADDR_WIDTH-1 : 0] addr;
   rand bit [C_S00_AXI_DATA_WIDTH-1 : 0] data;
   rand bit avalid;
   rand bit dvalid;
   
   `uvm_object_utils_begin(axil_frame)   
   `uvm_object_utils_end

   function new(string name = "axil_frame");
      super.new(name);
   endfunction 

endclass : axil_frame

`endif

