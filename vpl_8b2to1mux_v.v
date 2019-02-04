module vpl_8b2to1mux_v(ayy,sel,q);
	input[7:0] ayy; 
	input sel;
	output reg[7:0] q;
	
	always@(ayy,sel)
	if(sel)
		q = ayy;
	else
		q = 8'b00000000;
		
endmodule
