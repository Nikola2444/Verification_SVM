onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /calc_verif_top/calc_vif/clk
add wave -noupdate /calc_verif_top/calc_vif/rst
add wave -noupdate /calc_verif_top/calc_vif/out_data1
add wave -noupdate /calc_verif_top/calc_vif/out_resp1
add wave -noupdate /calc_verif_top/calc_vif/req1_cmd_in
add wave -noupdate /calc_verif_top/calc_vif/req1_data_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
