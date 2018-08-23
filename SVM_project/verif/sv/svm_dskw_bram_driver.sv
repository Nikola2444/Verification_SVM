/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_bram_driver.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_BRAM_DRIVER_SV
 `define SVM_DSKW_BRAM_DRIVER_SV
`uvm_analysis_imp_decl(_interrupt_done)
class svm_dskw_bram_driver extends uvm_driver#(bram_frame);

   `uvm_component_utils(svm_dskw_bram_driver)
   uvm_analysis_imp_interrupt_done#(interrupt_frame, svm_dskw_bram_driver) port_interrupt_done;
   // The virtual interface used to drive and view HDL signals.
   virtual interface bram_if vif;
   int     interrupt_done = 0;
   logic [31:0] address;
   
   function new(string name = "svm_dskw_bram_driver", uvm_component parent = null);
      super.new(name,parent);
      port_interrupt_done = new("port_interrupt_done", this);
   endfunction

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (!uvm_config_db#(virtual bram_if)::get(this, "*", "bram_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
   endfunction : connect_phase

   task run_phase(uvm_phase phase);
     
      forever begin
	      
	      @(posedge vif.clk)begin	   
	         if(interrupt_done == 1)begin
		         interrupt_done = 0;	       
		         req.interrupt = 1;       
		         continue;
	         end
	         address = vif.axi_address;	    
	         if(vif.axi_en)begin
		         
		         if(vif.axi_address < 784)begin

		            seq_item_port.get_next_item(req);
		            req.address = address;
		            seq_item_port.item_done();

		            
		            seq_item_port.get_next_item(req);
		            `uvm_info(get_type_name(),
			                   $sformatf("Driver sending...\n%s", req.sprint()),
			                   UVM_HIGH)
		            vif.axi_in_data = req.in_data;
		            seq_item_port.item_done();		  		            		            
		         end // if (vif.axi_address < 784)	       
	         end // if (vif.axi_en)
	         
	      end 	    
	      
      end // forever begin
      
   endtask : run_phase

   function write_interrupt_done (interrupt_frame tr);
      `uvm_info(get_type_name(),
			       $sformatf("INTERRUPT HAPPENED"),
			       UVM_FULL)
      interrupt_done = 1;
      
   endfunction : write_interrupt_done   

endclass : svm_dskw_bram_driver

`endif

