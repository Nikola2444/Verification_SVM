/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            interrupt_frame.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef INTERRUPT_FRAME_SV
`define INTERRUPT_FRAME_SV

class interrupt_frame extends uvm_sequence_item;
    `uvm_object_utils_begin(interrupt_frame)   
    `uvm_object_utils_end
    
    function new(string name = "interrupt_frame");
        super.new(name);
    endfunction 

endclass : interrupt_frame

`endif

