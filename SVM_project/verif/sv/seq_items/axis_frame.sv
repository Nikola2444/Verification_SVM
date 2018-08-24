/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            axis_frame.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef AXIS_FRAME_SV
 `define AXIS_FRAME_SV

class axis_frame extends uvm_sequence_item;
   logic [31:0] dataQ [$];
   int 		len;   
   `uvm_object_utils_begin(axis_frame)   
      `uvm_field_int(len, UVM_ALL_ON)
   `uvm_object_utils_end

   function new(string name = "axis_frame");
      super.new(name);
   endfunction 

endclass : axis_frame

`endif

