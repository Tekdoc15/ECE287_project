module desproject (
clk,
rst,
seg7_dig0[6:0],
seg7_dig1[6:0],
seg7_dig2[6:0],
seg7_dig3[6:0],
seg7_dig4[6:0],
seg7_dig5[6:0],
seg7_dig6[6:0],
seg7_dig7[6:0]
);

input clk,rst;

// variable for hardcoded default value to encrypt on start and reset
reg [63:0]message;
reg [63:0]encryptedmessage;
reg [63:0]usermessage;
reg [63:0]encryptedusermessage;


output [6:0] seg7_dig0,seg7_dig1,seg7_dig2,seg7_dig3,seg7_dig4,seg7_dig5,seg7_dig6,seg7_dig7;

wire [3:0]digit0 = 4'b1111;
wire [3:0]digit1 = 4'b0001;
wire [3:0]digit2 = 4'b0010;
wire [3:0]digit3 = 4'b0011;
wire [3:0]digit4 = 4'b0100;
wire [3:0]digit5 = 4'b0101;
wire [3:0]digit6 = 4'b0110;
wire [3:0]digit7 = 4'b0111;

// Instansiate seven segment displays

sevenseg seg7_0(digit0,seg7_dig0);
sevenseg seg7_1(digit1,seg7_dig1);
sevenseg seg7_2(digit2,seg7_dig2);
sevenseg seg7_3(digit3,seg7_dig3);
sevenseg seg7_4(digit4,seg7_dig4);
sevenseg seg7_5(digit5,seg7_dig5);
sevenseg seg7_6(digit6,seg7_dig6);
sevenseg seg7_7(digit7,seg7_dig7);
/*
/* FSM signals and paramters /
reg [2:0] S,NS; //starting with 3 bits for 7 states can expand later

paramter START = 3'b000,
			ENCRYPT = 3'b001,
			WAIT = 3'b010,
			DISPLAY = 3'b011,
			INPUT = 3'b100;
			
/* S update always block /
always @ (posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
			S <= START;
		else
			S <= NS;
	end

/* NS transitions always block /
always @ (*)
	begin
		case (S)
			START: NS = ENCRYPT;
			ENCRYPT: NS = WAIT;
			WAIT:
				begin
					if (SOMESWITCH VALUE)
						NS = INPUT;
					else
						NS = DISPLAY;
				end
			DISPLAY: NS = WAIT;
			INPUT: NS = WAIT;
		endcase
	end
	
/* Control signals always block /
always @ (posedge clk or negedge rst)
	begin
		case (S)
			START:
				begin
					message <= 64'h0123456789ABCDEF;
				end
			ENCRYPT:
				begin
					
				end
			WAIT:
				begin
					message <= message;
					encryptedmessage <= encryptedmessage;
					usermessage <= usermessage;
					encryptedusermessage <= encryptedusermessage;
				end
		endcase
	end

/* always block for display choices /

always @ (*)
	case (display_control)
		3'b000:<first 8 encrypt>
		3'b001:<second 8 encrypt>
		3'b010:<first 8 decrypt>
		3'b011:<second 8 decrypt>
		3'b100:<first 8 user encrypt>
		3'b101:<second 8 user encrypt>
		3'b110:<first 8 user decrypt>
		3'b111:<second 8 user decrypt>
		default:<all 0s>
	endcase
*/
endmodule
