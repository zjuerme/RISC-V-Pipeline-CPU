vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../OExp02-IP2SOC.srcs/sources_1/ip/SSeg7_Dev_0/HexTo8SEG.v" \
"../../../../OExp02-IP2SOC.srcs/sources_1/ip/SSeg7_Dev_0/MC14495_ZJU.v" \
"../../../../OExp02-IP2SOC.srcs/sources_1/ip/SSeg7_Dev_0/MUX2T1_64.v" \
"../../../../OExp02-IP2SOC.srcs/sources_1/ip/SSeg7_Dev_0/P2S.v" \
"../../../../OExp02-IP2SOC.srcs/sources_1/ip/SSeg7_Dev_0/SSeg_map.v" \
"../../../../OExp02-IP2SOC.srcs/sources_1/ip/SSeg7_Dev_0/SSeg7_Dev.v" \
"../../../../OExp02-IP2SOC.srcs/sources_1/ip/SSeg7_Dev_0/sim/SSeg7_Dev_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

