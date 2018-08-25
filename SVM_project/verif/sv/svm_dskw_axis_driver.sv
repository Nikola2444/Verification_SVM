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
   bit interrupt=0;

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
      forever 
      begin
         //@(posedge vif.clk)
         `uvm_info(get_type_name(), $sformatf("Driver starting..."), UVM_HIGH)
         while(!interrupt)
         begin
            @(negedge vif.clk);
            vif.s_axis_tlast=0;
            vif.s_axis_tvalid=0;
         end
         interrupt=0;

         seq_item_port.get_next_item(req);
         //`uvm_info(get_type_name(), $sformatf("Driver sending...\n%s", req.sprint()), UVM_HIGH)
         // do actual driving here
         foreach (req.dataQ[i])
         begin
            #1 if(i==(req.dataQ.size-1))
               vif.s_axis_tlast=1;
            else
               vif.s_axis_tlast=0;

            vif.s_axis_tvalid=1;
            vif.s_axis_tdata=req.dataQ[i];
            @(posedge vif.clk iff vif.s_axis_tready);
         end
         seq_item_port.item_done();
      end
   endtask : run_phase
   
   function write_interrupt_done (interrupt_frame tr);
      `uvm_info(get_type_name(),
		$sformatf("INTERRUPT HAPPENED"), UVM_HIGH)      
      interrupt=1;
   endfunction : write_interrupt_done
   
endclass : svm_dskw_axis_driver

`endif

