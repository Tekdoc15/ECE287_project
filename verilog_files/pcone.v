module pcone(clk,rst,key,subkey);

input clk,rst;

input [63:0] key;
output reg [55:0] subkey;

always @ (posedge clk or negedge rst)
	begin
	// concantenate the bits of the key into a sub key following this pattern:
	// |
	// | 57 | 49 | 41 | 33 | 25 | 17 | 9  |
	// | 1  | 58 | 50 | 42 | 34 | 26 | 18 |
	// | 10 | 2  | 59 | 51 | 43 | 35 | 27 |
	// | 19 | 11 | 3  | 60 | 52 | 44 | 36 |
	// | 63 | 55 | 47 | 39 | 31 | 23 | 15 |
	// | 7  | 62 | 54 | 46 | 38 | 30 | 22 |
	// | 14 | 6  | 61 | 53 | 45 | 37 | 29 |
	// | 21 | 13 | 5  | 28 | 20 | 12 | 4  |
	// Note: 8 of the bits are not used resulting in a 56 bit subkey.
		
	subkey <= {key[57],key[49],key[41],key[33],key[25],key[17],key[9],key[1],key[58],key[50],key[42],key[34],key[26],key[18],key[10],key[2],key[59],key[51],key[43],key[35],key[27],key[19],key[11],key[3],key[60],key[52],key[44],key[36],key[63],key[55],key[47],key[39],key[31],key[23],key[15],key[7],key[62],key[54],key[46],key[38],key[30],key[22],key[14],key[6],key[61],key[53],key[45],key[37],key[29],key[21],key[13],key[5],key[28],key[20],key[12],key[4]};
	end
endmodule

