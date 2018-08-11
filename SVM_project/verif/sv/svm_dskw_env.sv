/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            SVM_DSKW_env.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_ENV_SV
 `define SVM_DSKW_ENV_SV

class svm_dskw_env extends uvm_env;

   svm_dskw_agent bram_axis_agent;
   svm_dskw_axil_agent axil_agent;
   svm_dskw_interrupt_agent interrupt_agent;   
   svm_dskw_scoreboard scbd;
   svm_dskw_config cfg;
   
   `uvm_component_utils (svm_dskw_env)

   function new(string name = "svm_dskw_env", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      bram_axis_agent = svm_dskw_agent::type_id::create("bram_axis_agent", this);
      axil_agent = svm_dskw_axil_agent::type_id::create("axil_agent", this);
      interrupt_agent = svm_dskw_interrupt_agent::type_id::create("interrupt_agent", this);
      scbd = svm_dskw_scoreboard::type_id::create("scbd", this);
      if(!uvm_config_db#(svm_dskw_config)::get(this, "", "svm_dskw_config", cfg))
        `uvm_fatal("NOCONFIG",{"Config object must be set for: ",get_full_name(),".cfg"})
   endfunction : build_phase

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if(cfg.is_bram == WITH_BRAM)begin
	 bram_axis_agent.bram_mon.item_collected_port.connect(scbd.port_bram);
      end
      if (cfg.is_axis == WITH_AXIS)begin
	 bram_axis_agent.axis_mon.item_collected_port.connect(scbd.port_axis);
      end
      axil_agent.axil_mon.item_collected_port.connect(scbd.port_axil);
      interrupt_agent.interrupt_mon.item_collected_port.connect(scbd.port_interrupt);      
   endfunction : connect_phase

endclass : svm_dskw_env

`endif


