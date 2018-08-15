/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_scoreboard.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_SCOREBOARD_SV
 `define SVM_DSKW_SCOREBOARD_SV
`uvm_analysis_imp_decl(_bram)
`uvm_analysis_imp_decl(_axis)
`uvm_analysis_imp_decl(_axil)
`uvm_analysis_imp_decl(_interrupt)
class svm_dskw_scoreboard extends uvm_scoreboard;
   
   // control fileds
   bit checks_enable = 1;
   bit coverage_enable = 1;

   // This TLM port is used to connect the scoreboard to the monitor
   uvm_analysis_imp_bram#(image_transaction, svm_dskw_scoreboard) port_bram;
   uvm_analysis_imp_axis#(axis_frame, svm_dskw_scoreboard) port_axis;
   uvm_analysis_imp_axil#(axil_frame, svm_dskw_scoreboard) port_axil;
   uvm_analysis_imp_interrupt#(interrupt_frame, svm_dskw_scoreboard) port_interrupt;

   int num_of_tr;

   `uvm_component_utils_begin(svm_dskw_scoreboard)
      `uvm_field_int(checks_enable, UVM_DEFAULT)
      `uvm_field_int(coverage_enable, UVM_DEFAULT)
   `uvm_component_utils_end

   function new(string name = "svm_dskw_scoreboard", uvm_component parent = null);
      super.new(name,parent);
      port_bram = new("port_bram", this);
      port_axis = new("port_axis", this);
      port_axil = new("port_axil", this);
      port_interrupt = new("port_interrupt", this);
   endfunction : new

   function write_bram (image_transaction tr);
      image_transaction tr_clone;
      if(!$cast(tr_clone, tr.clone()))//clone is implemented in image_transaction class
	`uvm_error(get_type_name(), $sformatf("INVALID CAST"))
      
      if(checks_enable) begin
	 if(!tr_clone.image_deskewed)begin
	    //deskew_reference_model(tr_clone);	    
	 end
      end
      else begin
	 `uvm_info(get_type_name(),$sformatf("----------------------IMAGE WRITEN -----------------------------------"),UVM_MEDIUM)
      end

   endfunction : write_bram

   function write_axis (axis_frame tr);
      axis_frame tr_clone;
      $cast(tr_clone, tr.clone()); 
      if(checks_enable) begin
	 
      end
   endfunction : write_axis

   function write_axil (axil_frame tr);
      axil_frame tr_clone;
      $cast(tr_clone, tr.clone()); 
      if(checks_enable) begin
         // do actual checking here
         // ...
         // ++num_of_tr;
      end
   endfunction : write_axil

   function write_interrupt (interrupt_frame tr);
      interrupt_frame tr_clone;
      $cast(tr_clone, tr.clone()); 
      if(checks_enable) begin
         // do actual checking here
         // ...
         // ++num_of_tr;
      end
   endfunction : write_interrupt   

   function void report_phase(uvm_phase phase);
      `uvm_info(get_type_name(), $sformatf("Svm_dskw scoreboard examined: %0d transactions", num_of_tr), UVM_LOW);
   endfunction : report_phase

endclass : svm_dskw_scoreboard

`endif

