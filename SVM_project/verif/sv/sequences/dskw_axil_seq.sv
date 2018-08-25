/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            dskw_axil_seq.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef DSKW_AXIL_SEQ_SV
`define DSKW_AXIL_SEQ_SV

class dskw_axil_seq extends svm_dskw_axil_base_seq;

    `uvm_object_utils (dskw_axil_seq)
   int i = 1;   
    function new(string name = "dskw_axil_seq");
        super.new(name);
    endfunction

    virtual task body();
        // axil example - just send one item\
       `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 4;});
       `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 0;});
       `uvm_do_with(req, {req.read_write == 1; req.data == 1; req.address == 0;});
       `uvm_do_with(req, {req.read_write == 1; req.data == 0; req.address == 0;});
       `uvm_do_with(req, {req.read_write == 1; req.data == 1; req.address == 0;});       
       `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 4;});
       `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 0;});
       forever begin
          `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 4;});
          `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 0;});
       end
    endtask : body 

endclass : dskw_axil_seq

`endif

