module ipinverse(
input [63:0]reco_message,
output reg [63:0]messageinver
);

always @ (*)
	begin
		// rearrange message data per message IP block diagram
		// NOTE: the table is the proper bit the concantenation is starting the count from 0
		// |
		// | 40 | 8 | 48 | 16 | 56 | 24 | 64 | 32 |
		// | 39 | 7 | 47 | 15 | 55 | 23 | 63 | 31 |
		// | 38 | 6 | 46 | 14 | 54 | 22 | 62 | 30 |
		// | 37 | 5 | 45 | 13 | 53 | 21 | 61 | 29 |
		// | 36 | 4 | 44 | 12 | 52 | 20 | 60 | 28 |
		// | 35 | 3 | 43 | 11 | 51 | 19 | 59 | 27 |
		// | 34 | 2 | 42 | 10 | 50 | 18 | 58 | 26 |
		// | 33 | 1 | 41 | 9  | 49 | 17 | 57 | 25 |
		messageinver = {reco_message[39],reco_message[7],reco_message[47],reco_message[15],reco_message[55],reco_message[23],reco_message[63],reco_message[31],reco_message[38],reco_message[6],reco_message[46],reco_message[14],reco_message[54],reco_message[22],reco_message[62],reco_message[30],reco_message[37],reco_message[5],reco_message[45],reco_message[13],reco_message[53],reco_message[21],reco_message[61],reco_message[29],reco_message[36],reco_message[4],reco_message[44],reco_message[12],reco_message[52],reco_message[20],reco_message[60],reco_message[28],reco_message[25],reco_message[3],reco_message[43],reco_message[11],reco_message[51],reco_message[19],reco_message[59],reco_message[27],reco_message[34],reco_message[2],reco_message[42],reco_message[10],reco_message[50],reco_message[18],reco_message[58],reco_message[26],reco_message[33],reco_message[1],reco_message[41],reco_message[9],reco_message[49],reco_message[17],reco_message[57],reco_message[25],reco_message[32],reco_message[0],reco_message[40],reco_message[8],reco_message[48],reco_message[16],reco_message[56],reco_message[24]};
	end

endmodule

