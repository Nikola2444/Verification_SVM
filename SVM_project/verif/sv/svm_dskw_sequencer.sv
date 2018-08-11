/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            svm_dskw_sequencer.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_SEQUENCER_SV
`define SVM_DSKW_SEQUENCER_SV

class svm_dskw_sequencer extends uvm_sequencer#(svm_dskw_frame);

    `uvm_component_utils(svm_dskw_sequencer)

    function new(string name = "svm_dskw_sequencer", uvm_component parent = null);
        super.new(name,parent);
    endfunction

endclass : svm_dskw_sequencer

`endif

