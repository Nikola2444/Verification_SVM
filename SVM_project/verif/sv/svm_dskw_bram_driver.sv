/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_bram_driver.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_BRAM_DRIVER_SV
 `define SVM_DSKW_BRAM_DRIVER_SV

class svm_dskw_bram_driver extends uvm_driver#(bram_frame);

   `uvm_component_utils(svm_dskw_bram_driver)

   // The virtual interface used to drive and view HDL signals.
   virtual interface bram_if vif;

   function new(string name = "svm_dskw_bram_driver", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (!uvm_config_db#(virtual bram_if)::get(this, "*", "bram_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
   endfunction : connect_phase

   task run_phase(uvm_phase phase);
      seq_item_port.get_next_item(req);
      seq_item_port.item_done();
      forever begin
	 @(posedge vif.clk)begin
	    if(vif.axi_en)begin
	       req.address = vif.axi_address;
	       /*`uvm_info(get_type_name(),
			 $sformatf("req.address isL %b", req.address),
			 UVM_HIGH)*/
	       seq_item_port.get_next_item(req);	   
               `uvm_info(get_type_name(),
			 $sformatf("Driver sending...\n%s", req.sprint()),
			 UVM_HIGH)
	       vif.axi_in_data = req.in_data;	   
               // do actual driving here
               seq_item_port.item_done();
	    end
	 end
      end
   endtask : run_phase

endclass : svm_dskw_bram_driver

`endif

