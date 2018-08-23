/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_bram_monitor.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_BRAM_MONITOR_SV
 `define SVM_DSKW_BRAM_MONITOR_SV

class svm_dskw_bram_monitor extends uvm_monitor;

   // control fileds
   bit checks_enable = 1;
   bit coverage_enable = 1;
   int pixel_for_dskw = 0;
   int deskewed_pixel = 0;
   int address = 0;
   logic [31 : 0] in_data;   
   uvm_analysis_port #(image_transaction) item_collected_port;

   `uvm_component_utils_begin(svm_dskw_bram_monitor)
      `uvm_field_int(checks_enable, UVM_DEFAULT)
      `uvm_field_int(coverage_enable, UVM_DEFAULT)
   `uvm_component_utils_end

   // The virtual interface used to drive and view HDL signals.
   virtual        interface bram_if vif;
   
   // current transaction
   image_transaction current_frame;

   // coverage can go here
   // ...

   function new(string name = "svm_dskw_bram_monitor", uvm_component parent = null);
      super.new(name,parent);
      item_collected_port = new("item_collected_port", this);
   endfunction

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (!uvm_config_db#(virtual bram_if)::get(this, "*", "bram_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
   endfunction : connect_phase

   task run_phase(uvm_phase phase);

      current_frame = image_transaction::type_id::create("current_frame", this);      
      forever begin
	      // ...
	      // collect transactions
	      @(posedge vif.clk)begin
	         
	         @(negedge vif.axi_en)begin
	            if(pixel_for_dskw == 784)begin
		            
		            current_frame.image_deskewed = 0;
		            //`uvm_info(get_type_name(),$sformatf("vif_axi_in_data in bram_monitor is: %h", vif.axi_in_data),UVM_MEDIUM)
		            pixel_for_dskw ++;
		            item_collected_port.write(current_frame);
		            current_frame = image_transaction::type_id::create("current_frame", this);
	            end
	            else begin

		            if(pixel_for_dskw < 784 && address < 784)begin
		               #1;		     		     
		               current_frame.image[address] =  vif.axi_in_data;		     
		               pixel_for_dskw ++;
		            end

	            end // else: !if(pixel_for_dskw == 784)
	            
	         end
	         @(posedge vif.axi_en)begin
	            address = vif.axi_address;
               assert (address <= 1567)               
               else
                 `uvm_error(get_name(),$sformatf("address out of range: %d",address))
	            //address = vif.axi_address;	    
	            if(vif.axi_we == 4'b0011)begin
		            if(deskewed_pixel < 784) begin
		               deskewed_pixel ++;			     
		               current_frame.image[address-784] = vif.axi_out_data;		      
		            end
		            if(deskewed_pixel == 784)begin
		               pixel_for_dskw = 0;
		               deskewed_pixel = 0;
		               current_frame.image_deskewed = 1;
		               item_collected_port.write(current_frame);
		               `uvm_info(get_type_name(),$sformatf("---------------IMAGE DESKEWED--------------------------------------"),UVM_LOW)
		               current_frame = image_transaction::type_id::create("current_frame", this);
		            end                  
	            end // if (vif.axi_we == 4'b0011)
	         end // @(posedge vif.axi_en)	    
	      end // @ (posedge vif.clk)	    
      end // forever begin     
   endtask : run_phase
   
endclass : svm_dskw_bram_monitor

`endif

