class mux_sequencer extends uvm_sequencer #(mux_seq_item);

//factory registration
`uvm_component_utils(mux_sequencer);

//constructor 
function new(string name="mux_seq_item", uvm_component parent);
super.new(name,parent);
endfunction

endclass