/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            svm_dskw_agent.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_AGENT_SV
`define SVM_DSKW_AGENT_SV

class svm_dskw_agent extends uvm_agent;

    // components
    svm_dskw_driver drv;
    svm_dskw_sequencer seqr;
    svm_dskw_monitor mon;

    // configuration
    svm_dskw_config cfg;

    `uvm_component_utils_begin (svm_dskw_agent)
        `uvm_field_object(cfg, UVM_DEFAULT)
    `uvm_component_utils_end

    function new(string name = "svm_dskw_agent", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(svm_dskw_config)::get(this, "", "svm_dskw_config", cfg))
            `uvm_fatal("NOCONFIG",{"Config object must be set for: ",get_full_name(),".cfg"})

        mon = svm_dskw_monitor::type_id::create("mon", this);
        if(cfg.is_active == UVM_ACTIVE) begin
            drv = svm_dskw_driver::type_id::create("drv", this);
            seqr = svm_dskw_sequencer::type_id::create("seqr", this);
        end

    endfunction : build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if(cfg.is_active == UVM_ACTIVE) begin
            drv.seq_item_port.connect(seqr.seq_item_export);
        end
    endfunction : connect_phase

endclass : svm_dskw_agent

`endif

