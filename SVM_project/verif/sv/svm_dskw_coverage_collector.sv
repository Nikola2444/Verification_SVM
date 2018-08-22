`ifndef SVM_DSKW_COVERAGE_COLLECTOR
 `define SVM_DSKW_COVERAGE_COLLECTOR
`uvm_analysis_imp_decl(_coverage_axil)
class svm_dskw_coverage_collector extends uvm_component;
   
   uvm_analysis_imp_coverage_axil#(axil_frame, svm_dskw_coverage_collector) port_coverage_axil;
   bit checks_enable = 1;
   bit coverage_enable = 1;
  `uvm_component_utils_begin(svm_dskw_coverage_collector)
   `uvm_component_utils_end
   function new(string name = "svm_dskw_coverage_collector", uvm_component parent = null);
      super.new(name, parent);
      port_coverage_axil = new("port_coverage_axil", this);
   endfunction : new
   
   function void report_phase(uvm_phase phase);

   endfunction : report_phase
   
   function write_coverage_axil (axil_frame tr);
      axil_frame tr_clone;
      $cast(tr_clone, tr.clone()); 
      if(coverage_enable) begin
         // do actual checking here
         // ...
         // ++num_of_tr;
//         `uvm_info(get_name(),$sformatf("axil event happened"), UVM_LOW)
      end
   endfunction : write_coverage_axil
endclass : svm_dskw_coverage_collector
`endif
