/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_monitor.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_AXIL_MONITOR_SV
 `define SVM_DSKW_AXIL_MONITOR_SV
class svm_dskw_axil_monitor extends uvm_monitor;

   // control fileds
   bit checks_enable = 1;
   bit coverage_enable = 1;
   bit [31:0] address;
   
   uvm_analysis_port #(axil_frame) item_collected_port;

   `uvm_component_utils_begin(svm_dskw_axil_monitor)
      `uvm_field_int(checks_enable, UVM_DEFAULT)
      `uvm_field_int(coverage_enable, UVM_DEFAULT)
   `uvm_component_utils_end

   // The virtual interface used to drive and view HDL signals.
   virtual interface axil_if vif;

   // current transaction
   axil_frame current_frame;

   // coverage can go here
   
   covergroup write_address;
      option.per_instance = 1;
      write_address: coverpoint address{
         bins write_address_bin = {0};
      }
      data_write_cpt: coverpoint vif.s_axi_wdata {
         bins start_0 = {0};
         bins start_1 = {1};         
      }
   endgroup // write_read_address
   
   covergroup read_address;
      option.per_instance = 1;
      read_address: coverpoint address{
         bins start_address_bin = {0};
         bins ready_address_bin = {4};         
      }
      data_read_cp: coverpoint vif.s_axi_rdata{
         bins data_bin_ready = {1};
         bins data_bin_not_ready = {0};
      }
      raw_and_rbw: cross    read_address, data_read_cp;
       
   endgroup
   
   // ----------------------------------------------
   function new(string name = "svm_dskw_axil_monitor", uvm_component parent = null);
      super.new(name,parent);
      item_collected_port = new("item_collected_port", this);
      write_address = new();
      read_address = new();      
   endfunction

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (!uvm_config_db#(virtual axil_if)::get(this, "*", "axil_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})
      
   endfunction : connect_phase

   task run_phase(uvm_phase phase);
      
      
      forever begin

         current_frame = axil_frame::type_id::create("current_frame", this);
         @(posedge vif.clk)begin
            if(vif.s_axi_awready )begin
//               `uvm_info(get_name(), $sformatf("write address: %d", vif.s_axi_awaddr), UVM_LOW)
               address = vif.s_axi_awaddr;               
               write_address.sample();
            end
            if(vif.s_axi_arready)
               address = vif.s_axi_araddr;
            if(vif.s_axi_rvalid)begin
               read_address.sample();
               current_frame.data = vif.s_axi_rdata;
               current_frame.address = address;
               item_collected_port.write(current_frame);

  //             `uvm_info(get_name(), $sformatf("read address: %d \t read_data: %d", address, vif.s_axi_rdata), UVM_LOW)               
            end
         end
      end
   endtask : run_phase

endclass : svm_dskw_axil_monitor

`endif

