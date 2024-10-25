class mux_mon2 extends uvm_monitor;

`uvm_component_utils(mux_mon2)

mux_seq_item pkt2;

virtual mux_intf vif;

uvm_analysis_port #(mux_seq_item) item_collected_port2;

function new(string name="mux_mon2",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual mux_intf)::get(this,"","vif",vif);
item_collected_port2=new("item_collected_port2",this);
endfunction

task run_phase(uvm_phase phase);
pkt2=mux_seq_item::type_id::create("pkt2");
forever begin
#2;
//@(posedge vif.clk)
#5;
pkt2.y=vif.y;
`uvm_info("mon2","mon2 transactions",UVM_NONE);
//@(posedge vif.clk)
#5;
item_collected_port2.write(pkt2);
end 
endtask
endclass