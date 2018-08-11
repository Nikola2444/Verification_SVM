/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_interrupt_agent.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_INTERRUPT_AGENT_SV
 `define SVM_DSKW_INTERRUPT_AGENT_SV

class svm_dskw_interrupt_agent extends uvm_agent;

   // components
   //bram agent components

   svm_dskw_interrupt_monitor interrupt_mon;



   `uvm_component_utils_begin (svm_dskw_interrupt_agent)
   `uvm_component_utils_end

   function new(string name = "svm_dskw_interrupt_agent", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      interrupt_mon = svm_dskw_interrupt_monitor::type_id::create("interrupt_monitor", this);
   endfunction : build_phase

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
   endfunction : connect_phase

endclass : svm_dskw_interrupt_agent

`endif

