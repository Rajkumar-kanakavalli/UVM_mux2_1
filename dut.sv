module mux_dut(mux_intf.dut intf);

always@(intf.a,intf.b,intf.s)
begin
	if(intf.s==0) begin
	    intf.y=intf.a;
	end
	else begin 
	intf.y=intf.b;
		end
end

endmodule		
