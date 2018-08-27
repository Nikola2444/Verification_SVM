/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            svm_dskw_axis_seq.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_AXIS_SEQ_SV
`define SVM_DSKW_AXIS_SEQ_SV

class svm_dskw_axis_seq extends svm_dskw_axis_base_seq;

   `uvm_object_utils (svm_dskw_axis_seq)
   int i = 1;   
   function new(string name = "svm_dskw_axis_seq");
       super.new(name);
   endfunction

   virtual task body();
      `uvm_info(get_type_name(), $sformatf("Sequence starting..."), UVM_HIGH)
      for(image=0; image<10; image++)
      begin
         `uvm_info(get_type_name(), $sformatf("Sending %d image",image), UVM_HIGH);
         req=axis_frame::type_id::create("req");
         start_item(req);
         for(i=0; i<IMG_LEN; i++)
            req.dataQ.push_back(yQ[image*784+i]);
         finish_item(req);

         for(core=0; core<10; core++)
         begin

            `uvm_info(get_type_name(), $sformatf("Core %d calculating",core), UVM_NONE);
            for(sv=0; sv<sv_array[core]; sv++)
            begin
               //send support vector
               req=axis_frame::type_id::create("req");
               start_item(req);
               for(i=0; i<IMG_LEN; i++)
                  req.dataQ.push_back(svQ[core][sv*IMG_LEN + i]);
               finish_item(req);

               //send lambda(target)
               req=axis_frame::type_id::create("req");
               start_item(req);
               req.dataQ.push_back(ltQ[core][sv]);
               finish_item(req);
            end
            //send bias
            req=axis_frame::type_id::create("req");
            start_item(req);
            req.dataQ.push_back(bQ[core]);
            finish_item(req);
         end
      end  
    endtask : body 

endclass : svm_dskw_axis_seq

`endif

