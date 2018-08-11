/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_driver.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_AXIL_DRIVER_SV
 `define SVM_DSKW_AXIL_DRIVER_SV

class svm_dskw_axil_driver extends uvm_driver#(axil_frame);

   `uvm_component_utils(svm_dskw_axil_driver)

   // The virtual interface used to drive and view HDL signals.
   virtual interface axil_if vif;

   function new(string name = "svm_dskw_axil_driver", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (!uvm_config_db#(virtual axil_if)::get(this, "*", "axil_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
   endfunction : connect_phase

   task run_phase(uvm_phase phase);
      forever begin
         seq_item_port.get_next_item(req);
         `uvm_info(get_type_name(),
                   $sformatf("Driver sending...\n%s", req.sprint()),
                   UVM_HIGH)
         // do actual driving here
         seq_item_port.item_done();
      end
   endtask : run_phase

endclass : svm_dskw_axil_driver

`endif

