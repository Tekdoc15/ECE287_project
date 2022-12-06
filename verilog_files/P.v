module P(
input [31:0] Sout,
output reg [31:0] out
);

always @(*)
	begin
		out = {Sout[15],Sout[6],Sout[19],Sout[20],Sout[28],Sout[11],Sout[27],Sout[16],Sout[0],Sout[14],Sout[22],Sout[25],Sout[4],Sout[17],Sout[30],Sout[9],Sout[1],Sout[7],Sout[23],Sout[13],Sout[31],Sout[26],Sout[2],Sout[8],Sout[18],Sout[12],Sout[29],Sout[5],Sout[21],Sout[10],Sout[3],Sout[24]};
	end
	
endmodule

