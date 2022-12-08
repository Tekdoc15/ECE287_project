module dataip(data,dataip);

input [63:0] data;
output reg [63:0] dataip;

always @ (*)
	begin
		// rearrange message data per message IP block diagram
		// |
		// | 58 | 50 | 42 | 34 | 26 | 18 | 10 | 2 |
		// | 60 | 52 | 44 | 36 | 28 | 20 | 12 | 4 |
		// | 62 | 54 | 46 | 38 | 30 | 22 | 14 | 6 |
		// | 64 | 56 | 48 | 40 | 32 | 24 | 16 | 8 |
		// | 57 | 49 | 41 | 33 | 25 | 17 | 9  | 1 |
		// | 59 | 51 | 43 | 35 | 27 | 19 | 11 | 3 |
		// | 61 | 53 | 45 | 37 | 29 | 21 | 13 | 5 |
		// | 63 | 55 | 47 | 39 | 31 | 23 | 15 | 7 |
		dataip = {data[58],data[50],data[42],data[34],data[26],data[18],data[10],data[2],data[60],data[52],data[44],data[36],data[28],data[20],data[12],data[4],data[62],data[54],data[46],data[38],data[30],data[22],data[14],data[6],data[64],data[56],data[48],data[40],data[32],data[24],data[16],data[8],data[57],data[49],data[41],data[33],data[25],data[17],data[9],data[1],data[59],data[51],data[43],data[35],data[27],data[19],data[11],data[3],data[61],data[53],data[45],data[37],data[29],data[21],data[13],data[5],data[63],data[55],data[47],data[39],data[31],data[23],data[15],data[7]};
	end

endmodule

