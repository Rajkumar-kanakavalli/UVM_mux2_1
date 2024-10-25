class mux_seq_item extends uvm_sequence_item;

//data fields
rand bit[2:0] a,b;

//control fields
rand bit s;

//analysis fields
bit [2:0]y;

//factory registration
`uvm_object_utils_begin(mux_seq_item);
	`uvm_field_int(a,UVM_ALL_ON + UVM_DEC);
	`uvm_field_int(b,UVM_ALL_ON + UVM_DEC);
	`uvm_field_int(s,UVM_ALL_ON + UVM_BIN);
`uvm_object_utils_end

//constructor
function new(string name = "mux_seq_item");
super.new(name);
endfunction

//constraints
constraint ab{a != b;}

endclass