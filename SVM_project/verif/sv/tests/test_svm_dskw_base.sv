/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            test_calc_base.sv

    DESCRIPTION     base test; to be extended by all other tests

*******************************************************************************/

`ifndef TEST_SVM_DSKW_BASE_SV
`define TEST_SVM_DSKW_BASE_SV

class test_svm_dskw_base extends uvm_test;

    svm_dskw_env env;
    svm_dskw_config cfg;

    `uvm_component_utils(test_svm_dskw_base)

    function new(string name = "test_svm_dskw_base", uvm_component parent = null);
        super.new(name,parent);
    endfunction : new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = svm_dskw_env::type_id::create("env", this);
        cfg = svm_dskw_config::type_id::create("cfg");
        uvm_config_db#(svm_dskw_config)::set(this, "*", "svm_dskw_config", cfg);
    endfunction : build_phase

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

endclass : test_svm_dskw_base

`endif

