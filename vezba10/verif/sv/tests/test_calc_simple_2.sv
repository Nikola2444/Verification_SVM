/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            test_calc_simple_2.sv

    DESCRIPTION     example test

*******************************************************************************/

`ifndef TEST_CALC_SIMPLE_2_SV
`define TEST_CALC_SIMPLE_2_SV

class test_calc_simple_2 extends test_calc_base;

    `uvm_component_utils(test_calc_simple_2)

    calc_simple_seq simple_seq;

    function new(string name = "test_calc_simple_2", uvm_component parent = null);
        super.new(name,parent);
    endfunction : new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        simple_seq = calc_simple_seq::type_id::create("simple_seq");
    endfunction : build_phase

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        simple_seq.start(env.agent.seqr);
        phase.drop_objection(this);
    endtask : run_phase

endclass : test_calc_simple_2

`endif

