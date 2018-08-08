/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            calc_driver.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef CALC_DRIVER_SV
`define CALC_DRIVER_SV

class calc_driver extends uvm_driver#(calc_frame);

    `uvm_component_utils(calc_driver)

   virtual interface calc_if vif;
   
      
   function new(string name = "calc_driver", uvm_component parent = null);
      super.new(name,parent);
   endfunction // new
   
   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if(!uvm_config_db#(virtual calc_if)::get(this, "*","calc_if",vif))
	`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
   endfunction // connect_phase
   
   task run_phase(uvm_phase phase);
      forever begin
         seq_item_port.get_next_item(req);
	 @(posedge vif.clk)begin
         `uvm_info(get_type_name(),
                   $sformatf("Driver sending...\n%s", req.sprint()),
                   UVM_HIGH)
         // do actual driving here
	 drive_tr();
	 end
	 seq_item_port.item_done();
      end
   endtask : run_phase
   task drive_tr();
      vif.req1_cmd_in = req.req1_cmd_in;
      vif.req1_data_in = req.req1_data_in;      
   endtask
endclass : calc_driver

`endif

