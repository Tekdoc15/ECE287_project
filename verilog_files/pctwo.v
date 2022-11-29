module pctwo(clk,rst,subkey,pc2subkey);

input clk,rst;

input [55:0] subkey;
output reg [47:0] pc2subkey;

always @ (posedge clk or negedge rst)
	begin
		pc2subkey = {subkey[14],subkey[17],subkey[11],subkey[24],subkey[1],subkey[5],subkey[3],subkey[28],subkey[15],subkey[6],subkey[21],subkey[10],subkey[23],subkey[19],subkey[12],subkey[4],subkey[26],subkey[8],subkey[16],subkey[7],subkey[27],subkey[20],subkey[13],subkey[2],subkey[41],subkey[52],subkey[31],subkey[37],subkey[47],subkey[55],subkey[30],subkey[40],subkey[51],subkey[45],subkey[33],subkey[48],subkey[44],subkey[49],subkey[39],subkey[56],subkey[34],subkey[53],subkey[46],subkey[42],subkey[50],subkey[36],subkey[29],subkey[32]};
	end

endmodule

