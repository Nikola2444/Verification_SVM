/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            svm_dskw_sequencer.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef BRAM_SEQUENCER_SV
`define BEAM_SEQUENCER_SV

class bram_sequencer extends uvm_sequencer#(bram_frame);

    `uvm_component_utils(bram_sequencer)

    function new(string name = "bram_sequencer", uvm_component parent = null);
        super.new(name,parent);
    endfunction

endclass : bram_sequencer

`endif

