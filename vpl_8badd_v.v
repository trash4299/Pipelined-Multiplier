module vpl_8badd_v(ayy,bee,q,carry);
	input[7:0] ayy,bee;
	output[7:0] q;
	output carry;
	
	assign {carry,q} = ayy + bee;
	
endmodule
