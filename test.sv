class mux_test extends uvm_test;
`uvm_component_utils(mux_test)

mux_env env;
mux_sequence seq;

function new(string name="mux_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=mux_env::type_id::create("env",this);
seq=mux_sequence::type_id::create("seq",this);
endfunction:build_phase

task run_phase(uvm_phase phase);
phase.raise_objection(this);
	seq.start(env.agent1.seqr);
	#10;
phase.drop_objection(this);
endtask

endclass