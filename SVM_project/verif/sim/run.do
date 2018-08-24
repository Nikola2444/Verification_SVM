################################################################################
#    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
#    |F|u|n|c|t|i|o|n|a|l| |V|e|r|i|f|i|c|a|t|i|o|n| |o|f| |H|a|r|d|w|a|r|e|
#    +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+
#
#    FILE            run
#
#    DESCRIPTION
#
################################################################################

# Create the library.
if [file exists work] {
    vdel -all
}
vlib work

# compile DUT
vlog -cover bcs  -sv\
     +incdir+../../dut/DESKEW_SRC \
    ../../dut/DESKEW_SRC/Deskew_v1_0.v
vlog -cover bcs  -sv\
     +incdir+../../dut/SVM_SRC \
    ../../dut/SVM_SRC/SVM_IP_v1_0.v



# compile testbench
vlog +cover -sv \
    +incdir+$env(UVM_HOME) \
    +incdir+../sv \
    ../sv/svm_dskw_verif_pkg.sv \
    ../sv/svm_dskw_verif_top.sv
vopt svm_dskw_verif_top -o dut_optimized +cover 

# run simulation

vsim -coverage dut_optimized  -novopt +UVM_TIMEOUT=200 +UVM_TESTNAME=test_svm_dskw_simple_2 +UVM_VERBOSITY=UVM_LOW -sv_seed 10 -do "run -all"

#do wave.do