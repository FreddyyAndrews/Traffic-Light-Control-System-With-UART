onerror {quit -f}
vlib work
vlog -work work Project.vo
vlog -work work Project.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.testing_clk_vlg_vec_tst
vcd file -direction Project.msim.vcd
vcd add -internal testing_clk_vlg_vec_tst/*
vcd add -internal testing_clk_vlg_vec_tst/i1/*
add wave /*
run -all
