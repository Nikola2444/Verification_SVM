/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            svm_dskw_axil_seq.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_AXIL_SEQ_SV
`define SVM_DSKW_AXIL_SEQ_SV

class svm_dskw_axil_seq extends svm_dskw_axil_base_seq;

    `uvm_object_utils (svm_dskw_axil_seq)
   int i = 1;   
    function new(string name = "svm_dskw_axil_seq");
        super.new(name);
    endfunction

    virtual task body();
        // axil example - just send one item
       repeat(2)begin
	  if(i == 1)begin
	     `uvm_do_with(req, {req.dvalid==1;req.avalid == 1; req.read_write ==i;req.rready == 1;req.data == 1; req.address == 0;});
	  end
	  else begin
	     `uvm_do_with(req, {req.dvalid==1;req.avalid == 1; req.read_write ==0;req.rready == 1;req.address == 4;});
	  end
	  i--;	  
       end
    endtask : body 

endclass : svm_dskw_axil_seq

`endif

