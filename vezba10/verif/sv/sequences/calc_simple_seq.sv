/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            calc_simple_seq.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef CALC_SIMPLE_SEQ_SV
`define CALC_SIMPLE_SEQ_SV

class calc_simple_seq extends calc_base_seq;
   int i = 0;
   
    `uvm_object_utils (calc_simple_seq)

    function new(string name = "calc_simple_seq");
        super.new(name);
    endfunction

    virtual task body();
        // simple example - just send one item
       `uvm_do_with(req, {req.req1_data_in == 4;req.req1_cmd_in == 1;});
       for(i = 0; i<10; i++)begin
	 `uvm_do_with(req, {req.req1_data_in == 8;req.req1_cmd_in == 0;});

	  
       end
    endtask : body 

endclass : calc_simple_seq

`endif

