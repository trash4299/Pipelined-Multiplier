module vpl_dff_v(d,ld,clock,resetn,q);
	input d,ld,clock,resetn;
	output reg q;
	
	always@(posedge clock)
		if(resetn)
			q = 0;
		else if(ld)
			q = d;
		else
			q = q;
endmodule
