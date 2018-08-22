/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            test_calc_simple_2.sv

 DESCRIPTION     example test

 *******************************************************************************/

`ifndef TEST_SVM_DSKW_SIMPLE_2_SV
 `define TEST_SVM_DSKW_SIMPLE_2_SV

class test_svm_dskw_simple_2 extends test_svm_dskw_base;

   `uvm_component_utils(test_svm_dskw_simple_2)

   svm_dskw_axil_seq axil_seq;
   svm_dskw_axis_seq axis_seq;
   svm_dskw_bram_seq bram_seq;   
   

   function new(string name = "test_svm_dskw_simple_2", uvm_component parent = null);
      super.new(name,parent);
   endfunction : new
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      axil_seq = svm_dskw_axil_seq::type_id::create("axil_seq");
      axis_seq = svm_dskw_axis_seq::type_id::create("axis_seq");
      bram_seq = svm_dskw_bram_seq::type_id::create("bram_seq");

   endfunction : build_phase

   task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      phase.phase_done.set_drain_time(this, 1000);
      if(cfg.is_bram == WITH_BRAM) begin
	      fork
	         axil_seq.start(env.axil_agent.axil_seqr);	         	            
	         bram_seq.start(env.bram_axis_agent.bram_seqr);	         
	      join
      end
      if(cfg.is_axis == WITH_AXIS) begin
	      fork
            axis_seq.start(env.bram_axis_agent.axis_seqr);
	         axil_seq.start(env.axil_agent.axil_seqr);
	      join
      end
      
      phase.drop_objection(this);
   endtask : run_phase

endclass : test_svm_dskw_simple_2

`endif

