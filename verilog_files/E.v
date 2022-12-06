module E(
input [31:0]message_ipright,
output reg [47:0]out
);

always @(*)
	begin
		out = {message_ipright[31],message_ipright[0],message_ipright[1],message_ipright[2],message_ipright[3],message_ipright[4],message_ipright[3],message_ipright[4],message_ipright[5],message_ipright[6],message_ipright[7],message_ipright[8],message_ipright[9],message_ipright[8],message_ipright[9],message_ipright[10],message_ipright[11],message_ipright[12],message_ipright[13],message_ipright[12],message_ipright[13],message_ipright[14],message_ipright[15],message_ipright[16],message_ipright[15],message_ipright[16],message_ipright[17],message_ipright[18],message_ipright[19],message_ipright[20],message_ipright[19],message_ipright[20],message_ipright[21],message_ipright[22],message_ipright[23],message_ipright[24],message_ipright[23],message_ipright[24],message_ipright[25],message_ipright[26],message_ipright[27],message_ipright[28],message_ipright[27],message_ipright[28],message_ipright[29],message_ipright[30],message_ipright[31],message_ipright[0]};
	end
	
endmodule

