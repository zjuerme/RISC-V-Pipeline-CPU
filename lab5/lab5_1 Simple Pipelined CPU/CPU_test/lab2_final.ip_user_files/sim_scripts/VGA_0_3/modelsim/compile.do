vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -sv \
"E:/xlinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"E:/xlinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../lab2_final.srcs/sources_1/ip/VGA_0_3/Hex2Ascii.v" \
"../../../../lab2_final.srcs/sources_1/ip/VGA_0_3/VgaController.v" \
"../../../../lab2_final.srcs/sources_1/ip/VGA_0_3/VgaDebugger.v" \
"../../../../lab2_final.srcs/sources_1/ip/VGA_0_3/VgaDisplay.v" \
"../../../../lab2_final.srcs/sources_1/ip/VGA_0_3/VGA.v" \
"../../../../lab2_final.srcs/sources_1/ip/VGA_0_3/sim/VGA_0.v" \

vlog -work xil_defaultlib \
"glbl.v"
