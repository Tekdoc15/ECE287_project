module lab4 ( input [3:0]in, output reg [6:0]o); //o[6] = section g, o[5] = section f, o[4] = section e, o[3] = section d, o[2] = section c, o[1] = section b, o[0] = section a


always @ (*)
case (in)
	4'h0: begin // digit 0
	
	o[6:0] = 7'b1000000;
	end
	
	4'h1: begin // digit 1
	
	o[6:0] = 7'b1111001;
	end
	
	4'h2: begin //digit 2
	
	o[6:0] = 7'b0100100;
	end
	
	4'h3: begin //digit 3
	
	o[6:0] = 7'b0110000;
	end
	
	4'h4: begin //digit 4
	
	o[6:0] = 7'b0011001;
	end
	
	4'h5: begin //digit 5
	
	o[6:0] = 7'b0010010;
	end

	4'h6: begin //digit 6
	
	o[6:0] = 7'b0000010;
	end
	
	4'h7: begin //digit 7
	
	o[6:0] = 7'b1111000;
	end
	
	4'h8: begin //digit 8
	
	o[6:0] = 7'b0000000;
	end
	
	4'h9: begin //digit 9
	
	o[6:0] = 7'b0011000;
	end
	
	4'ha: begin //digit A
	
	o[6:0] = 7'b0001000;
	end
	
	4'hb: begin //digit B
	
	o[6:0] = 7'b0000011;
	end
	
	4'hc: begin //digit C
	
	o[6:0] = 7'b1000110;
	end
	
	4'hd: begin //digit D
	
	o[6:0] = 7'b0100001;
	end
	
	4'he: begin //digit E
	
	o[6:0] = 7'b0000110;
	end
	
	4'hf: begin //digit F
	
	o[6:0] = 7'b0001110;
	end
	endcase
endmodule
	