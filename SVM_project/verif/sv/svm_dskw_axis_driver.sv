/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_driver.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_AXIS_DRIVER_SV
 `define SVM_DSKW_AXIS_DRIVER_SV

class svm_dskw_axis_driver extends uvm_driver#(axis_frame);

   `uvm_component_utils(svm_dskw_axis_driver)
   uvm_analysis_imp_interrupt_done#(interrupt_frame, svm_dskw_axis_driver) port_interrupt_done;
   // The virtual interface used to drive and view HDL signals.
   virtual interface axis_if vif;

   function new(string name = "svm_dskw_axis_driver", uvm_component parent = null);
      super.new(name,parent);
      port_interrupt_done = new("port_interrupt_done", this);
   endfunction

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (!uvm_config_db#(virtual axis_if)::get(this, "*", "axis_if", vif))
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
   
   function write_interrupt_done (interrupt_frame tr);
      `uvm_info(get_type_name(),
		$sformatf("INTERRUPT HAPPENED"),
		UVM_HIGH)      
   endfunction : write_interrupt_done
   
endclass : svm_dskw_axis_driver

`endif

