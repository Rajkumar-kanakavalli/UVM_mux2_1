class mux_driver extends uvm_driver#(mux_seq_item);

virtual mux_intf vif;//virtual interface

mux_seq_item pkt;

`uvm_component_utils(mux_driver);//factory registration

//constructor
function new(string name="mux_driver",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual mux_intf)::get(this,"","vif",vif))
	`uvm_fatal("no_vif",{"virtual interface must set for: ",get_full_name(),".vif",vif})
endfunction

//run phase
virtual task run_phase(uvm_phase phase);
pkt = mux_seq_item::type_id::create("pkt");
forever begin
seq_item_port.get_next_item(pkt);
//@(posedge vif.clk)
#5;
vif.s <= 0;
vif.a = pkt.a;
vif.b = pkt.b;

//@(posedge vif.clk)
#10;
vif.s <= 1;
vif.a = pkt.a;
vif.b = pkt.b;
seq_item_port.item_done();
`uvm_info("Driver","Drv transaction to dut",UVM_NONE);
//@(posedge vif.clk);
#5;
end
endtask

endclass