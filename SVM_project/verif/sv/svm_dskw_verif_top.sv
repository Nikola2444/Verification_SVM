/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_verif_top.sv

 DESCRIPTION     top module

 *******************************************************************************/

module svm_dskw_verif_top#();
   

   import uvm_pkg::*;            // import the UVM library
`include "uvm_macros.svh"     // Include the UVM macros

   import svm_dskw_verif_pkg::*;
   
   logic  s00_axi_aclk = 0;
   logic  s00_axi_aresetn;

   // interface
   axil_if axil_vif(s00_axi_aclk, s00_axi_aresetn);//if svm interface is needed this is the place you should instantiate it
   bram_if bram_vif(s00_axi_aclk, s00_axi_aresetn);
   axis_if axis_vif(s00_axi_aclk, s00_axi_aresetn);
   interrupt_if interrupt_vif(s00_axi_aclk, s00_axi_aresetn);
   
   
   
   // DUT
   Deskew_axi_v1_0 #(.WIDTH(16),
                     .ADDRESS(1))
   Deskew_Axi(.s00_axi_aclk(s00_axi_aclk),
              .s00_axi_aresetn(s00_axi_aresetn),
              .s00_axi_awaddr(axil_vif.s00_axi_awaddr),
              .s00_axi_awprot(axil_vif.s00_axi_awprot),
              .s00_axi_awvalid(axil_vif.s00_axi_awvalid),
              .s00_axi_awready(axil_vif.s00_axi_awready),
              .s00_axi_wdata(axil_vif.s00_axi_wdata),
              .s00_axi_wstrb(axil_vif.s00_axi_wstrb),
              .s00_axi_wvalid(axil_vif.s00_axi_wvalid),
              .s00_axi_wready(axil_vif.s00_axi_wready),
              .s00_axi_bresp(axil_vif.s00_axi_bresp),
              .s00_axi_bvalid(axil_vif.s00_axi_bvalid),
              .s00_axi_bready(axil_vif.s00_axi_bready),
              .s00_axi_araddr(axil_vif.s00_axi_araddr),
              .s00_axi_arprot(axil_vif.s00_axi_arprot),
              .s00_axi_arvalid(axil_vif.s00_axi_arvalid),
              .s00_axi_arready(axil_vif.s00_axi_arready),
              .s00_axi_rdata(axil_vif.s00_axi_rdata),
              .s00_axi_rresp(axil_vif.s00_axi_rresp),
              .s00_axi_rvalid(axil_vif.s00_axi_rvalid),
              .s00_axi_rready(axil_vif.s00_axi_rready),
              //user_logic
              .address(bram_vif.axi_address),
              .in_data(bram_vif.axi_in_data),
              .out_data(bram_vif.axi_out_data),
              .en(bram_vif.axi_en),
              .we(bram_vif.axi_we),
              .done_interrupt(interrupt_vif.done_interrupt)
              );
   initial begin
      uvm_config_db#(virtual axil_if)::set(null, "*", "axil_if", axil_vif);
      uvm_config_db#(virtual bram_if)::set(null, "*", "bram_if", bram_vif);
      uvm_config_db#(virtual axis_if)::set(null, "*", "axis_if", axis_vif);
      uvm_config_db#(virtual interrupt_if)::set(null, "*", "interrupt_if", interrupt_vif);
      run_test();
   end

   // clock and reset init.
   initial begin
      s00_axi_aclk <= 0;
      s00_axi_aresetn <= 0;
      #50 s00_axi_aresetn <= 1;
   end

   // clock generation
   always #50 s00_axi_aclk = ~s00_axi_aclk;

endmodule : svm_dskw_verif_top

