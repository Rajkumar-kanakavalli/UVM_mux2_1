`include "uvm_macros.svh"
import uvm_pkg::*;

`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "interface.sv"
`include "dut.sv"
`include "mon1.sv"
`include "agent1.sv"
`include "mon2.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module mux_top;

/* bit rst;
bit clk;

initial begin
clk = 1'b0;
forever #5 clk = ~clk;
end

initial begin 
rst = 0;
#1;
rst = 1'b1;
end */

mux_intf vif();
mux_dut DUT(vif);

initial begin
uvm_config_db #(virtual mux_intf)::set(uvm_root::get(),"*","vif",vif);

$dumpfile("dump.vcd"); $dumpvars;
end
initial begin
run_test("mux_test");


end
endmodule