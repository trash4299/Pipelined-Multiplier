module vpl_lab11_v(multiplicand,multiplier,start,clock,fp,cout,done);
	input[7:0] multiplicand;
	input[3:0] multiplier;
	input start,clock;
	output[11:0] fp;
	output cout;
	output reg done;
	
	reg res_cdff,res_ph,ld_cdff,ld_ph,ld_m,ld_mpl,shr;
	integer MC,n;
	
	wire[3:0] prepromult,mpl_val;
	wire[7:0] cand,muxtoadd,ph_val,ph_in;
	wire addcarry,sin1,sout1,sout2;
	
	vpl_mreg_v candreg(multiplicand,clock,ld_m,cand);
	vpl_8b2to1mux_v mux(cand,sout2,muxtoadd);
	vpl_8badd_v add(ph_val,muxtoadd,ph_in,addcarry);
	vpl_dff_v cdff(addcarry,ld_cdff,clock,res_cdff,sin1);
	vpl_phreg_v highreg(ph_in,sin1,ld_ph,shr,res_ph,clock,ph_val,sout1);
	vpl_mplreg_v lowreg(prepromult,sout1,ld_mpl,shr,clock,mpl_val,sout2);
	assign prepromult = multiplier & 4'b0111;
	assign {cout,fp} = {ph_val,mpl_val} + 12'b101010101010;
	
	initial begin
		MC = 0;
	end
	
	always@(posedge clock)
	begin
		if(MC == 0)
		begin
			res_cdff = 1;
			res_ph = 1;
			ld_cdff = 0;
			ld_ph = 0;
			ld_m = 1;
			ld_mpl = 1;
			shr = 0;
			n = 4;
			done = 0;
			if(start == 1)
				MC = 1;
		end
		else if(MC == 1)
		begin
			res_cdff = 0;
			res_ph = 0;
			ld_cdff = 1;
			ld_ph = 1;
			ld_m = 0;
			ld_mpl = 0;
			shr = 0;
			done = 0;
			MC = 2;
		end
		else if(MC == 2)
		begin
			res_cdff = 0;
			res_ph = 0;
			ld_cdff = 0;
			ld_ph = 0;
			ld_m = 0;
			ld_mpl = 0;
			shr = 1;
			n = n - 1;
			done = 0;
			if(n == 0)
				MC = 3;
			else
				MC = 1;
		end
		else if(MC == 3)
		begin
			res_cdff = 0;
			res_ph = 0;
			ld_cdff = 0;
			ld_ph = 0;
			ld_m = 0;
			ld_mpl = 0;
			shr = 0;
			done = 1;
			MC = 0;
		end
	end	
endmodule
