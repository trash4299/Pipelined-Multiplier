module vpl_phreg_v(d,sin,ld_ph,shr,res_ph,clock,q,sout);
	input[7:0] d;
	input sin,ld_ph,shr,res_ph,clock;
	output reg[7:0] q;
	output sout;
	
	assign sout = q[0];
	
	always@(posedge clock)
		if(res_ph)
			q = 8'b00000000;
		else if(shr)
			q = {sin,q[7:1]};
		else if(ld_ph)
			q = d;
		else 
			q = q;
endmodule
