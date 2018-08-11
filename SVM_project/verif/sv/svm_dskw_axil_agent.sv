/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_axil_agent.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_AXIL_AGENT_SV
 `define SVM_DSKW_AXIL_AGENT_SV

class svm_dskw_axil_agent extends uvm_agent;

   // components
   //bram agent components
   svm_dskw_axil_driver axil_drv;
   svm_dskw_axil_monitor axil_mon;
   axil_sequencer axil_seqr;


   `uvm_component_utils_begin (svm_dskw_axil_agent)
   `uvm_component_utils_end

   function new(string name = "svm_dskw_axil_agent", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      axil_drv = svm_dskw_axil_driver::type_id::create("axil_drv", this);
      axil_seqr = axil_sequencer::type_id::create("axil_seqr", this);
      axil_mon = svm_dskw_axil_monitor::type_id::create("axil_monitor", this);
   endfunction : build_phase

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      axil_drv.seq_item_port.connect(axil_seqr.seq_item_export);      
   endfunction : connect_phase

endclass : svm_dskw_axil_agent

`endif

