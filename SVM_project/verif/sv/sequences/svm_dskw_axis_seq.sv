/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            svm_dskw_axis_seq.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_AXIS_SEQ_SV
`define SVM_DSKW_AXIS_SEQ_SV

class svm_dskw_axis_seq extends svm_dskw_axis_base_seq;

    `uvm_object_utils (svm_dskw_axis_seq)
   int i = 1;   
    function new(string name = "svm_dskw_axis_seq");
        super.new(name);
    endfunction

    virtual task body();
        // axis example - just send one itemf
    endtask : body 

endclass : svm_dskw_axis_seq

`endif

