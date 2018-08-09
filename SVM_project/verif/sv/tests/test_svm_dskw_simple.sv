/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            test_calc_simple.sv

    DESCRIPTION     example test

*******************************************************************************/

`ifndef TEST_SVM_DSKW_SIMPLE_SV
`define TEST_SVM_DSKW_SIMPLE_SV

class test_svm_dskw_simple extends test_svm_dskw_base;

    `uvm_component_utils(test_svm_dskw_simple)

    function new(string name = "test_svm_dskw_simple", uvm_component parent = null);
        super.new(name,parent);
    endfunction : new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        uvm_config_db#(uvm_object_wrapper)::set(this, "seqr.run_phase","default_sequence",svm_dskw_simple_seq::type_id::get());
    endfunction : build_phase

endclass : test_svm_dskw_simple

`endif

