/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            calc_scoreboard.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef CALC_SCOREBOARD_SV
`define CALC_SCOREBOARD_SV

class calc_scoreboard extends uvm_scoreboard;

    // control fileds
    bit checks_enable = 1;
    bit coverage_enable = 1;

    // This TLM port is used to connect the scoreboard to the monitor
    uvm_analysis_imp#(calc_frame, calc_scoreboard) item_collected_imp;

    int num_of_tr;

    `uvm_component_utils_begin(calc_scoreboard)
        `uvm_field_int(checks_enable, UVM_DEFAULT)
        `uvm_field_int(coverage_enable, UVM_DEFAULT)
    `uvm_component_utils_end

    function new(string name = "calc_scoreboard", uvm_component parent = null);
        super.new(name,parent);
        item_collected_imp = new("item_collected_imp", this);
    endfunction : new

    function write (calc_frame tr);
        calc_frame tr_clone;
        $cast(tr_clone, tr.clone()); 
        if(checks_enable) begin
	   `uvm_info(get_name(), $sformatf("data1: %h \t cmd1: %h", tr_clone.req1_data_in, tr_clone.req1_cmd_in), UVM_HIGH);
           // do actual checking here
            // ...
            // ++num_of_tr;
        end
    endfunction : write

	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("Calc scoreboard examined: %0d transactions", num_of_tr), UVM_LOW);
	endfunction : report_phase

endclass : calc_scoreboard

`endif

