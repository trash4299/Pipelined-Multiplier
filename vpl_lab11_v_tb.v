module vpl_lab11_v_tb;
	reg[7:0] multiplicand_tb;
	reg[3:0] multiplier_tb;
	reg start_tb,clock_tb;
	
	wire[11:0] fp_tb;
	wire cout_tb,done_tb;
	
	integer yooo;
	
	vpl_lab11_v dut(multiplicand_tb,multiplier_tb,start_tb,clock_tb,fp_tb,cout_tb,done_tb);
	
	initial
	begin
	
		start_tb = 0;
		multiplicand_tb=8'b00000000; multiplier_tb=4'b0000; 
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb=1;
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb = 0;
		for(yooo=0;yooo<10;yooo=yooo+1)
			begin
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;			
			end
		
		start_tb = 0;
		multiplicand_tb=8'b11111111; multiplier_tb=4'b1111; 
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb=1;
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb = 0;
		for(yooo=0;yooo<10;yooo=yooo+1)
			begin
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;			
			end
			
		start_tb = 0;
		multiplicand_tb=8'b01010101; multiplier_tb=4'b0101; 
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb=1;
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;
				start_tb = 0;
		for(yooo=0;yooo<10;yooo=yooo+1)
			begin
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;			
			end
			
		start_tb = 0;
		multiplicand_tb=8'b10101010; multiplier_tb=4'b1010; 
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb=1;
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb = 0;
		for(yooo=0;yooo<10;yooo=yooo+1)
			begin
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;			
			end
			
		start_tb = 0;
		multiplicand_tb=8'b01010101; multiplier_tb=4'b1010; 
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb=1;
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;		
				start_tb = 0;
		for(yooo=0;yooo<10;yooo=yooo+1)
			begin
				#20000
				clock_tb=1;
				#20000
				clock_tb=0;			
			end
	end
endmodule
