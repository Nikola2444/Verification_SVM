onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /svm_dskw_verif_top/axil_vif/clk
add wave -noupdate /svm_dskw_verif_top/axil_vif/rst
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_awaddr
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_awvalid
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_awready
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_wdata
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_wvalid
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_wready
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_bresp
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_bvalid
add wave -noupdate -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_bready
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_araddr
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_arvalid
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_arready
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rdata
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rresp
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rvalid
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rready
add wave -noupdate /svm_dskw_verif_top/bram_vif/axi_en
add wave -noupdate /svm_dskw_verif_top/interrupt_vif/done_interrupt
add wave -noupdate -radix decimal /svm_dskw_verif_top/bram_vif/axi_address
add wave -noupdate /svm_dskw_verif_top/bram_vif/axi_out_data
add wave -noupdate /svm_dskw_verif_top/bram_vif/axi_in_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {845 ps} 0}
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
WaveRestoreZoom {212 ps} {4166 ps}
