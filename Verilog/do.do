onerror {stop}
vlib work
vmap work work
vlog -work work *.v
vsim work.t_top
add wave -noupdate /t_top/DUT/CLOCK_50
add wave -noupdate /t_top/DUT/video/clk
add wave -noupdate -radix unsigned /t_top/DUT/data_a
add wave -noupdate -radix unsigned /t_top/DUT/addr_a
add wave -noupdate -radix unsigned /t_top/DUT/video/reset
add wave -noupdate -radix unsigned /t_top/DUT/video/video_on
add wave -noupdate -radix unsigned /t_top/DUT/video/pixel_row
add wave -noupdate -radix unsigned /t_top/DUT/video/pixel_column
add wave -noupdate -radix unsigned /t_top/DUT/addr_b
add wave -noupdate -radix unsigned /t_top/DUT/q_b
add wave -noupdate -radix hexadecimal /t_top/DUT/VGA_R
add wave -noupdate -radix hexadecimal /t_top/DUT/VGA_G
add wave -noupdate -radix hexadecimal /t_top/DUT/VGA_B
WaveRestoreCursors {Inicio {30000 ps} 1} {FimDaLinha1 {25630000 ps} 1} {InicioDaLinha2 {32070000 ps} 1} {FimDoQuadro {15372790000 ps} 1} {Cursor {15404830000 ps} 0}
WaveRestoreZoom {0 ps} {20 ms}
run 20 ms