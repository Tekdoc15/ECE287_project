module lab4 ( input [3:0]in, output reg [6:0]o);




//o[6] = section g, o[5] = section f, o[4] = section e, o[3] = section d, o[2] = section c, o[1] = section b, o[0] = section a


always @ (*)
case (in)
	4'h0: o[6:0] = 7'b1000000; // digit 0
	4'h1: o[6:0] = 7'b1111001; // digit 1
	4'h2: o[6:0] = 7'b0100100; // digit 2
	4'h3: o[6:0] = 7'b0110000; // digit 3
	4'h4: o[6:0] = 7'b0011001; // digit 4
	4'h5: o[6:0] = 7'b0010010; // digit 5
	4'h6: o[6:0] = 7'b0000010; // digit 6
	4'h7: o[6:0] = 7'b1111000; // digit 7
	4'h8: o[6:0] = 7'b0000000; // digit 8
	4'h9: o[6:0] = 7'b0011000; // digit 9
	4'ha: o[6:0] = 7'b0001000; // digit A
	4'hb: o[6:0] = 7'b0000011; // digit b
	4'hc: o[6:0] = 7'b1000110; // digit C
	4'hd: o[6:0] = 7'b0100001; // digit d
	4'he: o[6:0] = 7'b0000110; // digit E
	4'hf: o[6:0] = 7'b0001110; // digit F
endcase
endmodule
	
