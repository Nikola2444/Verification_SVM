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
   logic   s00_axi_aresetn;

    // interface
    svm_dskw_if svm_dskw_vif(s00_axi_aclk, s00_axi_aresetn);

    // DUT
    Deskew_axi_v1_0 #(.WIDTH(16),
                      .ADDRESS(svm_dskw_vif.ADDRESS))
                     Deskew_Axi(.s00_axi_aclk(s00_axi_aclk),
                    .s00_axi_aresetn(s00_axi_aresetn),
                    .s00_axi_awaddr(svm_dskw_vif.s00_axi_awaddr),
                    .s00_axi_awprot(svm_dskw_vif.s00_axi_awprot),
                    .s00_axi_awvalid(svm_dskw_vif.s00_axi_awvalid),
                    .s00_axi_awready(svm_dskw_vif.s00_axi_awready),
                    .s00_axi_wdata(svm_dskw_vif.s00_axi_wdata),
                    .s00_axi_wstrb(svm_dskw_vif.s00_axi_wstrb),
                    .s00_axi_wvalid(svm_dskw_vif.s00_axi_wvalid),
                    .s00_axi_wready(svm_dskw_vif.s00_axi_wready),
                    .s00_axi_bresp(svm_dskw_vif.s00_axi_bresp),
                    .s00_axi_bvalid(svm_dskw_vif.s00_axi_bvalid),
                    .s00_axi_bready(svm_dskw_vif.s00_axi_bready),
                    .s00_axi_araddr(svm_dskw_vif.s00_axi_araddr),
                    .s00_axi_arprot(svm_dskw_vif.s00_axi_arprot),
                    .s00_axi_arvalid(svm_dskw_vif.s00_axi_arvalid),
                    .s00_axi_arready(svm_dskw_vif.s00_axi_arready),
                    .s00_axi_rdata(svm_dskw_vif.s00_axi_rdata),
                    .s00_axi_rresp(svm_dskw_vif.s00_axi_rresp),
                    .s00_axi_rvalid(svm_dskw_vif.s00_axi_rvalid),
                    .s00_axi_rready(svm_dskw_vif.s00_axi_rready),
                    //user_logic
                    .address(svm_dskw_vif.axi_address),
                    .in_data(svm_dskw_vif.axi_in_data),
                    .out_data(svm_dskw_vif.axi_out_data),
                    .en(svm_dskw_vif.axi_en),
                    .we(svm_dskw_vif.axi_we),
                    .done_interrupt(svm_dskw_vif.done_interrupt)
                    );
    initial begin
        uvm_config_db#(virtual svm_dskw_if)::set(null, "*", "svm_dskw_if", svm_dskw_vif);
        run_test();
    end

    // clock and reset init.
    initial begin
        s00_axi_aclk <= 0;
        s00_axi_aresetn <= 1;
        #50 s00_axi_aresetn <= 0;
    end

    // clock generation
    always #50 s00_axi_aclk = ~s00_axi_aclk;

endmodule : svm_dskw_verif_top

