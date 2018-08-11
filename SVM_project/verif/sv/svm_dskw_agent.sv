/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_agent.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_AGENT_SV
 `define SVM_DSKW_AGENT_SV

class svm_dskw_agent extends uvm_agent;

   // components
   //bram agent components
   svm_dskw_bram_driver bram_drv;
   svm_dskw_bram_monitor bram_mon;
   bram_sequencer bram_seqr;
   //axis agent components
   svm_dskw_axis_driver axis_drv;
   svm_dskw_axis_monitor axis_mon;
   axis_sequencer axis_seqr;
   

   // configuration
   svm_dskw_config cfg;

   `uvm_component_utils_begin (svm_dskw_agent)
      `uvm_field_object(cfg, UVM_DEFAULT)
   `uvm_component_utils_end

   function new(string name = "svm_dskw_agent", uvm_component parent = null);
      super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db#(svm_dskw_config)::get(this, "", "svm_dskw_config", cfg))
        `uvm_fatal("NOCONFIG",{"Config object must be set for: ",get_full_name(),".cfg"})

      if(cfg.is_bram == WITH_BRAM) begin
         bram_drv = svm_dskw_bram_driver::type_id::create("bram_drv", this);
	 bram_seqr = bram_sequencer::type_id::create("bram_seqr", this);
	 bram_mon = svm_dskw_bram_monitor::type_id::create("bram_monitor", this);
      end
      if(cfg.is_axis == WITH_AXIS)begin
	 axis_drv = svm_dskw_axis_driver::type_id::create("axis_drv", this);
	 axis_seqr = axis_sequencer::type_id::create("axis_seqr", this);
	 axis_mon = svm_dskw_axis_monitor::type_id::create("axis_monitor", this);
      end

   endfunction : build_phase

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if(cfg.is_bram == WITH_BRAM) begin
         bram_drv.seq_item_port.connect(bram_seqr.seq_item_export);
      end
      if(cfg.is_axis == WITH_AXIS) begin
         axis_drv.seq_item_port.connect(axis_seqr.seq_item_export);
      end
   endfunction : connect_phase

endclass : svm_dskw_agent

`endif

