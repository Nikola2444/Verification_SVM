/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            calc_config.sv

    DESCRIPTION     

*******************************************************************************/

`ifndef CALC_CONFIG_SV
`define CALC_CONFIG_SV

class calc_config extends uvm_object;

    uvm_active_passive_enum is_active = UVM_ACTIVE;

    `uvm_object_utils_begin (calc_config)
        `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
    `uvm_object_utils_end

    function new(string name = "calc_config");
        super.new(name);
    endfunction

endclass : calc_config

`endif


