module vpl_mplreg_v(d,sin,ld_mpl,shr,clock,q,sout);
	input[3:0] d;
	input sin,ld_mpl,shr,clock;
	output reg[3:0] q;
	output sout;
	
	assign sout = q[0];
	
	always@(posedge clock)
		if(ld_mpl)
			q = d;
		else if(shr)
			q = {sin,q[3:1]};
		else
			q = q;
endmodule
