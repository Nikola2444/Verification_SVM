/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            SVM_DSKW_env.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_ENV_SV
`define SVM_DSKW_ENV_SV

class svm_dskw_env extends uvm_env;

    svm_dskw_agent agent;
    svm_dskw_scoreboard scbd;

    `uvm_component_utils (svm_dskw_env)

    function new(string name = "svm_dskw_env", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = svm_dskw_agent::type_id::create("agent", this);
        scbd = svm_dskw_scoreboard::type_id::create("scbd", this);
    endfunction : build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.mon.item_collected_port.connect(scbd.item_collected_imp);
    endfunction : connect_phase

endclass : svm_dskw_env

`endif


