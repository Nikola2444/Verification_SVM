onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /svm_dskw_verif_top/axil_vif/clk
add wave -noupdate /svm_dskw_verif_top/axil_vif/rst
add wave -noupdate /svm_dskw_verif_top/bram_vif/axi_en
add wave -noupdate /svm_dskw_verif_top/interrupt_vif/done_interrupt
add wave -noupdate -radix decimal /svm_dskw_verif_top/bram_vif/axi_address
add wave -noupdate /svm_dskw_verif_top/bram_vif/axi_out_data
add wave -noupdate /svm_dskw_verif_top/bram_vif/axi_in_data
add wave -noupdate /svm_dskw_verif_top/Deskew_Axi/Deskew/M_reg
add wave -noupdate /svm_dskw_verif_top/Deskew_Axi/Deskew/state
add wave -noupdate /svm_dskw_verif_top/Deskew_Axi/Deskew/mu11_reg
add wave -noupdate /svm_dskw_verif_top/Deskew_Axi/Deskew/mu02_reg
add wave -noupdate /svm_dskw_verif_top/Deskew_Axi/Deskew/R2_reg
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_awaddr
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_awvalid
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_awready
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_wdata
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_wvalid
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_wready
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_bresp
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_bvalid
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s_axi_bready
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s_axi_araddr
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s_axi_arvalid
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s_axi_arready
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s_axi_rdata
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s_axi_rresp
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s_axi_rvalid
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s_axi_rready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22400954 ps} 0}
configure wave -namecolwidth 301
configure wave -valuecolwidth 112
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {22400954 ps} {23413178 ps}
