onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /svm_dskw_verif_top/axil_vif/clk
add wave -noupdate /svm_dskw_verif_top/axil_vif/rst
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_awaddr
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_awvalid
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_awready
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_wdata
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_wvalid
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_wready
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_bresp
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_bvalid
add wave -noupdate -expand -group axil_write /svm_dskw_verif_top/axil_vif/s00_axi_bready
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_araddr
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_arvalid
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_arready
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rdata
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rresp
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rvalid
add wave -noupdate -group axil_read /svm_dskw_verif_top/axil_vif/s00_axi_rready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {150 ps} 0}
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
WaveRestoreZoom {0 ps} {768 ps}
