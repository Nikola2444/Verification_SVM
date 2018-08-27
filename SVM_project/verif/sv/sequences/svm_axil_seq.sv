/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            dskw_axil_seq.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_AXIL_SEQ_SV
`define SVM_AXIL_SEQ_SV

class svm_axil_seq extends svm_dskw_axil_base_seq;
   int num_of_images = 0;
   int image = 0;   
    `uvm_object_utils (svm_axil_seq)
   int i = 1;   
    function new(string name = "svm_axil_seq");
        super.new(name);
    endfunction

    virtual task body();
        // axil example - just send one item\
       assert(std::randomize(num_of_images) with {num_of_images > 0; num_of_images <= 10;});
       
       `uvm_info(get_type_name(), $sformatf("%d images are beinge classified ",num_of_images), UVM_NONE);
       `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 4;});
       `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 0;});
       `uvm_do_with(req, {req.read_write == 1; req.data == 1; req.address == 0;});
       `uvm_do_with(req, {req.read_write == 1; req.data == 0; req.address == 0;});
       //`uvm_do_with(req, {req.read_write == 1; req.data == 1; req.address == 0;});       
       `uvm_do_with(req, {req.read_write == 0; req.data == 0; req.address == 4;});
       `uvm_do_with(req, {req.read_write == 0; req.data == 0; req.address == 0;});
       forever begin
          `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 4;});
          if(req.data == 1)begin
            `uvm_do_with(req, {req.read_write == 0; req.data == 1; req.address == 8;});
             image ++;             
             if(image == num_of_images)
               break;
             `uvm_do_with(req, {req.read_write == 1; req.data == 1; req.address == 0;});
             `uvm_do_with(req, {req.read_write == 1; req.data == 0; req.address == 0;});
          end
       end

    endtask : body 

endclass : svm_axil_seq

`endif

