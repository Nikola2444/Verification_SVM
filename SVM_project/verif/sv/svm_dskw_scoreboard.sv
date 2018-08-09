/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            svm_dskw_scoreboard.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_SCOREBOARD_SV
`define SVM_DSKW_SCOREBOARD_SV

class svm_dskw_scoreboard extends uvm_scoreboard;

    // control fileds
    bit checks_enable = 1;
    bit coverage_enable = 1;

    // This TLM port is used to connect the scoreboard to the monitor
    uvm_analysis_imp#(svm_dskw_frame, svm_dskw_scoreboard) item_collected_imp;

    int num_of_tr;

    `uvm_component_utils_begin(svm_dskw_scoreboard)
        `uvm_field_int(checks_enable, UVM_DEFAULT)
        `uvm_field_int(coverage_enable, UVM_DEFAULT)
    `uvm_component_utils_end

    function new(string name = "svm_dskw_scoreboard", uvm_component parent = null);
        super.new(name,parent);
        item_collected_imp = new("item_collected_imp", this);
    endfunction : new

    function write (svm_dskw_frame tr);
        svm_dskw_frame tr_clone;
        $cast(tr_clone, tr.clone()); 
        if(checks_enable) begin
            // do actual checking here
            // ...
            // ++num_of_tr;
        end
    endfunction : write

	function void report_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("Svm_dskw scoreboard examined: %0d transactions", num_of_tr), UVM_LOW);
	endfunction : report_phase

endclass : svm_dskw_scoreboard

`endif

