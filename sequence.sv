class mux_sequence extends uvm_sequence #(mux_seq_item);

//factory registration
`uvm_object_utils(mux_sequence);

mux_seq_item pkt;

/* //constructor  
function new(string name = "mux_sequence");
super.new(name);
endfunction */

virtual task body();
pkt=mux_seq_item::type_id::create("pkt");
repeat(9)
begin
start_item(pkt);
void'(pkt.randomize());
finish_item(pkt);
end
endtask

endclass