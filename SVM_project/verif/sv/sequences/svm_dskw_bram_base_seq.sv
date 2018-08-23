/*******************************************************************************
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
 |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
 +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

 FILE            svm_dskw_bram_base_seq.sv

 DESCRIPTION     base sequence; to be extended by all other sequences

 *******************************************************************************/

`ifndef SVM_DSKW_BRAM_BASE_SEQ_SV
 `define SVM_DSKW_BRAM_BASE_SEQ_SV

class svm_dskw_bram_base_seq extends uvm_sequence#(bram_frame);

   `uvm_object_utils(svm_dskw_bram_base_seq)
   `uvm_declare_p_sequencer(bram_sequencer)
   
   logic [15:0] images_queue[$];
   logic [15:0] img;
   int 		fd_img;
   string 	file_path = "../../images_for_deskew/y_bin.txt";
   int 		i = 0;
   rand bit[15:0] 		num_of_images;   


   
   function new(string name = "svm_dskw_bram_base_seq");
      super.new(name);
   endfunction

   // objections are raised in pre_body
   virtual task pre_body();
      uvm_phase phase = get_starting_phase();
      if (phase != null)
        phase.raise_objection(this, {"Running sequence '", get_full_name(), "'"});
      
   endtask : pre_body 

   // objections are dropped in post_body
   virtual task post_body();
      uvm_phase phase = get_starting_phase();
      if (phase != null)
        phase.drop_objection(this, {"Completed sequence '", get_full_name(), "'"});
   endtask : post_body

   function void read_deskew_images();
      fd_img = ($fopen(file_path, "r"));
      if(fd_img)begin
         `uvm_info(get_type_name(),$sformatf("FILE WITH IMAGES OPENED "),UVM_HIGH)
         while(!$feof(fd_img))begin
            if(i == 783) begin
               $fscanf(fd_img ,"%b\n",img);
               images_queue.push_back(img);
               num_of_images++;
               i = 0;             
            end  
            else begin
               $fscanf(fd_img ,"%b",img);
               images_queue.push_back(img);
               i++;
            end
            
         end // while (!$feof(fd_img))
	 `uvm_info(get_type_name(),$sformatf("NUMBER OF IMAGES IN FILE %d", num_of_images),UVM_HIGH)
      end
      else
	`uvm_info(get_type_name(),$sformatf("ERROR OPENING FILE WITH IMAGES"),UVM_HIGH)
      $fclose(fd_img);
   endfunction

endclass : svm_dskw_bram_base_seq

`endif

