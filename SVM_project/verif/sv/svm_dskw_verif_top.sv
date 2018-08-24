/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_verif_top.sv

 DESCRIPTION     top module

 *******************************************************************************/

module svm_dskw_verif_top#
  (parameter integer C_S_AXI_DATA_WIDTH	= 32,
   parameter integer C_S_AXI_ADDR_WIDTH = 4,
   parameter integer C_S_AXIS_TDATA_WIDTH = 32
   )
   ();
   
//`define SVM_DSKW
   import uvm_pkg::*;            // import the UVM library
`include "uvm_macros.svh"     // Include the UVM macros

   import svm_dskw_verif_pkg::*;
   
   logic             s_axi_aclk = 0;
   logic             s_axi_aresetn;

   // interface
   axil_if axil_vif(s_axi_aclk, s_axi_aresetn);//if svm interface is needed this is the place you should instantiate it
   bram_if bram_vif(s_axi_aclk, s_axi_aresetn);
   axis_if axis_vif(s_axi_aclk, s_axi_aresetn);
   interrupt_if interrupt_vif(s_axi_aclk, s_axi_aresetn);
   
   
   
   // DUT
`ifndef SVM_DSKW
   Deskew_axi_v1_0 #
     (.WIDTH(16),
      .ADDRESS(1))
   Deskew_Axi
     (
      .s00_axi_aclk(s_axi_aclk),
      .s00_axi_aresetn(s_axi_aresetn),
      .s00_axi_awaddr(axil_vif.s_axi_awaddr),
      .s00_axi_awprot(axil_vif.s_axi_awprot),
      .s00_axi_awvalid(axil_vif.s_axi_awvalid),
      .s00_axi_awready(axil_vif.s_axi_awready),
      .s00_axi_wdata(axil_vif.s_axi_wdata),
      .s00_axi_wstrb(axil_vif.s_axi_wstrb),
      .s00_axi_wvalid(axil_vif.s_axi_wvalid),
      .s00_axi_wready(axil_vif.s_axi_wready),
      .s00_axi_bresp(axil_vif.s_axi_bresp),
      .s00_axi_bvalid(axil_vif.s_axi_bvalid),
      .s00_axi_bready(axil_vif.s_axi_bready),
      .s00_axi_araddr(axil_vif.s_axi_araddr),
      .s00_axi_arprot(axil_vif.s_axi_arprot),
      .s00_axi_arvalid(axil_vif.s_axi_arvalid),
      .s00_axi_arready(axil_vif.s_axi_arready),
      .s00_axi_rdata(axil_vif.s_axi_rdata),
      .s00_axi_rresp(axil_vif.s_axi_rresp),
      .s00_axi_rvalid(axil_vif.s_axi_rvalid),
      .s00_axi_rready(axil_vif.s_axi_rready),
      //user_logic
      .address(bram_vif.axi_address),
      .in_data(bram_vif.axi_in_data),
      .out_data(bram_vif.axi_out_data),
      .en(bram_vif.axi_en),
      .we(bram_vif.axi_we),
      .done_interrupt(interrupt_vif.done_interrupt)
      );
 
`else 
   SVM_IP_v1_0 #
     (
      .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
      .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH),
      .C_S_AXIS_TDATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .WIDTH(WIDTH)                
      )
   SVM_IP_inst
     (
      .s_axi_aclk(s_axi_aclk),
      .s_axi_aresetn(s_axi_aresetn),
      .s_axi_awaddr(axil_vif.s_axi_awaddr),
      .s_axi_awprot(axil_vif.s_axi_awprot),
      .s_axi_awvalid(axil_vif.s_axi_awvalid),
      .s_axi_awready(axil_vif.s_axi_awready),
      .s_axi_wdata(axil_vif.s_axi_wdata),
      .s_axi_wstrb(axil_vif.s_axi_wstrb),
      .s_axi_wvalid(axil_vif.s_axi_wvalid),
      .s_axi_wready(axil_vif.s_axi_wready),
      .s_axi_bresp(axil_vif.s_axi_bresp),
      .s_axi_bvalid(axil_vif.s_axi_bvalid),
      .s_axi_bready(axil_vif.s_axi_bready),
      .s_axi_araddr(axil_vif.s_axi_araddr),
      .s_axi_arprot(axil_vif.s_axi_arprot),
      .s_axi_arvalid(axil_vif.s_axi_arvalid),
      .s_axi_arready(axil_vif.s_axi_arready),
      .s_axi_rdata(axil_vif.s_axi_rdata),
      .s_axi_rresp(axil_vif.s_axi_rresp),
      .s_axi_rvalid(axil_vif.s_axi_rvalid),
      .s_axi_rready(axil_vif.s_axi_rready),
      .s_axis_aclk(s_axi_aclk),
      .s_axis_aresetn(s_axi_aresetn),
      .s_axis_tready(axis_vif.s_axis_tready),
      .s_axis_tdata(axis_vif.s_axis_tdata),
      .s_axis_tstrb(axis_vif.s_axis_tstrb),
      .s_axis_tlast(axis_vif.s_axis_tlast),
      .s_axis_tvalid(axis_vif.s_axis_tvalid),
      .interrupt(interrupt_vif.done_interrupt)
      ); 

`endif
   initial begin
      set_global_timeout(0.3ms/1ps);
      uvm_config_db#(virtual axil_if)::set(null, "*", "axil_if", axil_vif);
`ifndef SVM_DSKW
      uvm_config_db#(virtual bram_if)::set(null, "*", "bram_if", bram_vif);
`else
      uvm_config_db#(virtual axis_if)::set(null, "*", "axis_if", axis_vif);
`endif
      uvm_config_db#(virtual interrupt_if)::set(null, "*", "interrupt_if", interrupt_vif);
      run_test();
   end

   // clock and reset init.
   initial begin

      s_axi_aclk <= 0;
      s_axi_aresetn <= 0;
      #50 s_axi_aresetn <= 1;
   end

   // clock generation
   always #50 s_axi_aclk = ~s_axi_aclk;

endmodule : svm_dskw_verif_top

