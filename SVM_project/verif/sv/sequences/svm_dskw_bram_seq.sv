/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_bram_seq.sv

 DESCRIPTION     

 *******************************************************************************/

`ifndef SVM_DSKW_BRAM_SEQ_SV
 `define SVM_DSKW_BRAM_SEQ_SV

class svm_dskw_bram_seq extends svm_dskw_bram_base_seq;

   `uvm_object_utils (svm_dskw_bram_seq)
   int image = 0;   
   function new(string name = "svm_dskw_bram_seq");
      super.new(name);
   endfunction

   virtual task body();
      req = bram_frame::type_id::create("req");
      start_item(req);
      finish_item(req);       
      read_deskew_images();
      forever begin
	 start_item(req); // adresa je ogranicena na validan opseg
	 if(image < num_of_images)begin
	    if(req.interrupt)begin
	       req.interrupt = 0;
	       image ++;	       	       
	    end
	    else begin
	    `uvm_info(get_type_name(),
		      $sformatf("req.address isL %b", req.address),
		      UVM_HIGH)
	    req.in_data = images_queue[image * 784 + req.address];
	    end
	 end
	 else
	   break;
	 finish_item(req);
      end
   endtask : body 

endclass : svm_dskw_bram_seq

`endif
