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
      @(negedge vif.rst);       
      forever begin
         seq_item_port.get_next_item(req);
         `uvm_info(get_type_name(),
                   $sformatf("Driver sending...\n%s", req.sprint()),
                   UVM_HIGH)
         // do actual driving here
	 
	 @(posedge vif.clk)begin//writing using AXIL
	    if(req.read_write)begin
	       `uvm_info(get_type_name(),
			 $sformatf("entered write",),
			 UVM_HIGH)
	       vif.s00_axi_awaddr = req.address;
	       vif.s00_axi_awvalid = req.avalid;
	       vif.s00_axi_wdata = req.data;
	       vif.s00_axi_wvalid = req.dvalid;
	       vif.s00_axi_bready = 1'b1;	       
	       wait(vif.s00_axi_awready && vif.s00_axi_wready);	       
	       wait(vif.s00_axi_bvalid);
	       vif.s00_axi_wdata = 0;
	       vif.s00_axi_awvalid = 0; 
	       vif.s00_axi_wvalid = 0;
               wait(!vif.s00_axi_bvalid);	   
	       vif.s00_axi_bready = 0;
	    end // if (req.read_write)
	    else begin
	       vif.s00_axi_araddr = req.address;
               vif.s00_axi_arvalid = req.avalid;
               vif.s00_axi_rready = req.rready;
	       wait(vif.s00_axi_arready);
               wait(vif.s00_axi_rvalid);	           
	       vif.s00_axi_arvalid = 0;
               vif.s00_axi_araddr = 0;
	       wait(!vif.s00_axi_rvalid);
	       vif.s00_axi_rready = 0;	       
	    end
	      
	 end // @ (posedge vif.s00_axi_aclk)
	 
	 //end of driving
         seq_item_port.item_done();
      end
   endtask : run_phase

endclass : svm_dskw_axil_driver
`endif

