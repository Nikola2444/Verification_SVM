/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            calc_monitor.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef CALC_MONITOR_SV
`define CALC_MONITOR_SV

class calc_monitor extends uvm_monitor;

    // control fileds
    bit checks_enable = 1;
    bit coverage_enable = 1;

    uvm_analysis_port #(calc_frame) item_collected_port;

    `uvm_component_utils_begin(calc_monitor)
        `uvm_field_int(checks_enable, UVM_DEFAULT)
        `uvm_field_int(coverage_enable, UVM_DEFAULT)
    `uvm_component_utils_end

    // The virtual interface used to drive and view HDL signals.
    virtual interface calc_if vif;

    // current transaction
    calc_frame current_frame;

    // coverage can go here
    // ...

    function new(string name = "calc_monitor", uvm_component parent = null);
        super.new(name,parent);
        item_collected_port = new("item_collected_port", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if (!uvm_config_db#(virtual calc_if)::get(this, "*", "calc_if", vif))
            `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
    endfunction : connect_phase

    task run_phase(uvm_phase phase);
         forever begin
            current_frame = calc_frame::type_id::create("current_frame", this);
            @(posedge vif.clk)begin
               current_frame.req1_data_in = vif.req1_data_in;
	       current_frame.req1_cmd_in = vif.req1_cmd_in;
	       item_collected_port.write(current_frame);
	    end
	    //`uvm_info(get_name(), $sformatf("data1: %h \t cmd1: %h", current_frame.req1_data_in, current_frame.req1_cmd_in), UVM_HIGH);
	    
            // ...
            // item_collected_port.write(current_frame);
         end
    endtask : run_phase

endclass : calc_monitor

`endif

