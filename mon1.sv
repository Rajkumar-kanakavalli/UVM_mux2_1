class mux_mon1 extends uvm_monitor;

`uvm_component_utils(mux_mon1)

mux_seq_item pkt1;

virtual mux_intf vif;

uvm_analysis_port #(mux_seq_item) item_collected_port1;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual mux_intf)::get(this,"","vif",vif);
item_collected_port1=new("item_collected_port1",this);
endfunction

task run_phase(uvm_phase phase);
pkt1=mux_seq_item::type_id::create("pkt1");
forever begin
//@(posedge vif.clk)
#5;
pkt1.s=vif.s;
pkt1.a=vif.a;
pkt1.b=vif.b;
pkt1.y=vif.y;
`uvm_info("mon1","mon1 transactions",UVM_NONE);
//@(posedge vif.clk)
#5;
item_collected_port1.write(pkt1);
end
endtask

endclass