/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE           svm_dskw_config.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef SVM_DSKW_CONFIG_SV
`define SVM_DSKW_CONFIG_SV

class svm_dskw_config extends uvm_object;

    uvm_active_passive_enum is_active = UVM_ACTIVE;

    `uvm_object_utils_begin (svm_dskw_config)
        `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
    `uvm_object_utils_end

    function new(string name = "svm_dskw_config");
        super.new(name);
    endfunction

endclass : svm_dskw_config

`endif


