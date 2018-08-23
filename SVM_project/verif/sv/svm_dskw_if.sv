/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_if.sv

 DESCRIPTION     svm_dskw interface

 *******************************************************************************/

`ifndef SVM_DSKW_IF_SV
 `define SVM_DSKW_IF_SV
parameter integer WIDTH = 16;
parameter integer ADDRESS  = 4;   		
parameter integer C_S00_AXI_DATA_WIDTH	= 32;
parameter integer C_S00_AXI_ADDR_WIDTH	= 4;
parameter integer C_S_AXIS_TDATA_WIDTH	= 32;
interface axil_if (input clk, logic rst);
   // Ports of Axi Slave Bus Interface S00_AXI
   
   logic [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr ;
   logic [2 : 0]                      s00_axi_awprot ;
   logic                              s00_axi_awvalid ;
   logic                              s00_axi_awready;
   logic [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata ;
   logic [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb = 4'b1111;
   logic                                  s00_axi_wvalid ;
   logic                                  s00_axi_wready;
   logic [1 : 0]                          s00_axi_bresp;
   logic                                  s00_axi_bvalid;
   logic                                  s00_axi_bready ;
   logic [C_S00_AXI_ADDR_WIDTH-1 : 0]     s00_axi_araddr ;
   logic [2 : 0]                          s00_axi_arprot ;
   logic                                  s00_axi_arvalid ;
   logic                                  s00_axi_arready;
   logic [C_S00_AXI_DATA_WIDTH-1 : 0]     s00_axi_rdata;
   logic [1 : 0]                          s00_axi_rresp;
   logic                                  s00_axi_rvalid;
   logic                                  s00_axi_rready ;
   
   

endinterface : axil_if

interface bram_if (input clk, logic rst);
   //signals for comunicating with BRAM 
   logic [31:0]                           axi_address;
   logic [WIDTH-1 : 0]                    axi_in_data = 0;
   logic [WIDTH-1 : 0]                    axi_out_data;
   logic                                  axi_en ;
   logic [3:0]                            axi_we ;
   
endinterface : bram_if
interface interrupt_if (input clk, logic rst);
   logic                                  done_interrupt;
endinterface : interrupt_if

interface axis_if (input clk, logic rst);
   // Ports of Axi Slave Bus Interface S_AXIS
   logic [C_S_AXIS_TDATA_WIDTH-1 : 0]     s_axis_tdata;
   logic [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] s_axis_tstrb;
   logic                                  s_axis_aclk;
   logic                                  s_axis_aresetn;
   logic                                  s_axis_tready;
   logic                                  s_axis_tlast;
   logic                                  s_axis_tvalid;
   
   
endinterface : axis_if


`endif

