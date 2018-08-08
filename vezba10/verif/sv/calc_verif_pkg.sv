/*******************************************************************************
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+

    FILE            calc_verif_pkg.sv

    DESCRIPTION     package

*******************************************************************************/

`ifndef CALC_VERIF_PKG_SV
`define CALC_VERIF_PKG_SV

package calc_verif_pkg;

    import uvm_pkg::*;            // import the UVM library
    `include "uvm_macros.svh"     // Include the UVM macros

    `include "calc_config.sv"
    `include "calc_frame.sv"
    `include "calc_driver.sv"
    `include "calc_sequencer.sv"
    `include "calc_monitor.sv"
    `include "calc_agent.sv"

    `include "calc_scoreboard.sv"
    `include "calc_env.sv"

    `include "sequences/calc_seq_lib.sv"
    `include "tests/test_lib.sv"

endpackage : calc_verif_pkg

`include "calc_if.sv"

`endif

