module vpl_mreg_v(m_val,clock,ld_m,q);
	input[7:0] m_val;
	input ld_m,clock;
	output reg[7:0] q;
	
	always@(posedge clock)
		if(ld_m)
			q = m_val;
		else
			q = q;
endmodule
