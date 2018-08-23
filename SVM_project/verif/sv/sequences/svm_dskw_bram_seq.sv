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
   endfunction // new
   
   
   virtual task body();     
      read_deskew_images();
      
      req = bram_frame::type_id::create("req");

        
      assert(std::randomize(num_of_images) with {num_of_images > 0; num_of_images <= 5;})

      `uvm_info(get_type_name(),
			       $sformatf("Num of images is: %d", num_of_images),
			       UVM_LOW)
      `uvm_info(get_name(),$sformatf("Image num: %d", image + 1), UVM_LOW)
      forever begin
         
	      start_item(req);	 
	      finish_item(req);

	      if(image < num_of_images)begin
	         if(req.interrupt)begin
	            req.interrupt = 0;               
	            image ++;
               if(image != num_of_images)
                 `uvm_info(get_name(),$sformatf("Image num: %d", image + 1), UVM_LOW)
	         end
	         else begin
	            req.in_data = images_queue[image * 784 + req.address];
	         end
	      end
	      else
	        break;

         
	      start_item(req);
	      finish_item(req);
      end // forever begin
      
   endtask : body 

endclass : svm_dskw_bram_seq

`endif

