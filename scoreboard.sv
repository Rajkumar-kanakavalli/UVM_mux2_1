class mux_scb extends uvm_scoreboard;

`uvm_component_utils(mux_scb)

mux_seq_item pkt1,pkt2;

uvm_tlm_analysis_fifo #(mux_seq_item)ip_fifo;
uvm_tlm_analysis_fifo #(mux_seq_item)op_fifo;

function new(string name = "mux_scb",uvm_component parent);
super.new(name,parent);
ip_fifo=new("ip_fifo",this);
op_fifo=new("op_fifo",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
pkt1 = mux_seq_item::type_id::create("pkt1",this);
pkt2 = mux_seq_item::type_id::create("pkt2",this);
endfunction

task run_phase(uvm_phase phase);
forever begin 
fork
ip_fifo.get(pkt1);
op_fifo.get(pkt2);
join

if(pkt2.y==pkt1.y) 
begin	
	`uvm_info("SCB: DATA MATCHED",$sformatf("dut y = %d, ref y =%d",pkt2.y,pkt1.y),UVM_NONE);
end
else begin
	 `uvm_info("SCB: DATA MISMATCHED",$sformatf("o/p y = %d, i/p y =%d",pkt2.y,pkt1.y),UVM_NONE);
end
end
endtask

endclass
