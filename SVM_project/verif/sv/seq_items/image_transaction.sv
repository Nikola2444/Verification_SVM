/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            image_transaction.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef IMAGE_TRANSACTION_SV
`define IMAGE_TRANSACTION_SV

class image_transaction extends uvm_sequence_item;
   logic [31:0]   image[784];
   bit 		  image_deskewed;
   
    `uvm_object_utils_begin(image_transaction)   
    `uvm_object_utils_end

    function new(string name = "image_transaction");
        super.new(name);
    endfunction 
   function void copy(image_transaction tr);
      super.copy(tr);      
      this.image = tr.image;
      this.image_deskewed = tr.image_deskewed;      
   endfunction

   function image_transaction clone ();
      clone = new();      
      clone.copy(this);
      return clone;
   endfunction : clone
endclass : image_transaction

`endif

