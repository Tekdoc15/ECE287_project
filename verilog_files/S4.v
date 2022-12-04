module S4 (in,out);
input [5:0]in;
output reg [3:0]out;

always @ (*)
	begin
	 case(in)
		6'b000000: out = 4'd7; //00 0000
		6'b000001: out = 4'd13; //01 0000
		6'b000010: out = 4'd13; //00 0001
		6'b000011: out = 4'd8; //01 0001
		6'b000100: out = 4'd14; //00 0010
		6'b000101: out = 4'd11; //01 0010
		6'b000110: out = 4'd3; //00 0011
		6'b000111: out = 4'd5; //01 0011
		6'b001000: out = 4'd0; //00 0100
		6'b001001: out = 4'd6; //01 0100
		6'b001010: out = 4'd6; //00 0101
		6'b001011: out = 4'd15; // 01 0101
		6'b001100: out = 4'd9; //00 0110
		6'b001101: out = 4'd0; //01 0110
		6'b001110: out = 4'd10; //00 0111
		6'b001111: out = 4'd3; //01 0111
		6'b010000: out = 4'd1; //00 1000
		6'b010001: out = 4'd4; //01 1000
		6'b010010: out = 4'd2; //00 1001
		6'b010011: out = 4'd7; //01 1001
		6'b010100: out = 4'd8; //00 1010
		6'b010101: out = 4'd2; //01 1010
		6'b010110: out = 4'd5; //00 1011
		6'b010111: out = 4'd12; //01 1011
		6'b011000: out = 4'd11; //00 1100
		6'b011001: out = 4'd1; //01 1100
		6'b011010: out = 4'd12; //00 1101
		6'b011011: out = 4'd10; //01 1101
		6'b011100: out = 4'd4; //00 1110
		6'b011101: out = 4'd14; //01 1110
		6'b011110: out = 4'd15; //00 1111
		6'b011111: out = 4'd9; //01 1111
		6'b100000: out = 4'd10; //10 0000
		6'b100001: out = 4'd3; //11 0000
		6'b100010: out = 4'd6; //10 0001
		6'b100011: out = 4'd15; //11 0001
		6'b100100: out = 4'd9; //10 0010
		6'b100101: out = 4'd0; //11 0010
		6'b100110: out = 4'd0; //10 0011 
		6'b100111: out = 4'd6; //11 0011
		6'b101000: out = 4'd12; //10 0100
		6'b101001: out = 4'd10; //11 0100
		6'b101010: out = 4'd11; //10 0101
		6'b101011: out = 4'd1; //11 0101
		6'b101100: out = 4'd7; //10 0110
		6'b101101: out = 4'd13; //11 0110
		6'b101110: out = 4'd13; //10 0111
		6'b101111: out = 4'd8; //11 0111
		6'b110000: out = 4'd15; //10 1000
		6'b110001: out = 4'd9; //11 1000
		6'b110010: out = 4'd1; //10 1001
		6'b110011: out = 4'd4; //11 1001
		6'b110100: out = 4'd3; //10 1010
		6'b110101: out = 4'd5; //11 1010
		6'b110110: out = 4'd14; // 10 1011
		6'b110111: out = 4'd11; //11 1011
		6'b111000: out = 4'd5; //10 1100
		6'b111001: out = 4'd12; //11 1100
		6'b111010: out = 4'd2; //10 1101
		6'b111011: out = 4'd7; //11 1101
		6'b111100: out = 4'd8; //10 1110
		6'b111101: out = 4'd2; //11 1110
		6'b111110: out = 4'd4; //10 1111
		6'b111111: out = 4'd14; //11 1111
	endcase
end

endmodule
		
