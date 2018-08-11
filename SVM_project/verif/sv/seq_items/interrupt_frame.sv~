/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            bram_frame.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef BRAM_FRAME_SV
`define BRAM_FRAME_SV
parameter integer WIDTH = 16;
class bram_frame extends uvm_sequence_item;
   logic [31:0] 			  address;
   logic [WIDTH-1 : 0] 			  in_data;
    `uvm_object_utils_begin(bram_frame)   
    `uvm_object_utils_end

    function new(string name = "bram_frame");
        super.new(name);
    endfunction 

endclass : bram_frame

`endif

