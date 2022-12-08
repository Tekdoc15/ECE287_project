module desproject (
clk,
rst,
keyclk,
keydata,
SW2,
SW1,
SW0,
seg7_dig0[6:0],
seg7_dig1[6:0],
seg7_dig2[6:0],
seg7_dig3[6:0],
seg7_dig4[6:0],
seg7_dig5[6:0],
seg7_dig6[6:0],
seg7_dig7[6:0],
gled
);

input clk,rst,keyclk,keydata;

input SW2,SW1,SW0;

output reg gled;

reg [2:0]display_control;
always @(*)
	begin
		display_control = {SW2,SW1,SW0};
	end

// variable for hardcoded default value to encrypt on start and reset
reg [63:0]message = 64'h0123456789ABCDEF;
reg [63:0]cipher = 64'h133457799BBCDFF1;
wire [63:0]encryptedmessage;
wire [63:0]decryptedmessage;

// Variables for user input
wire [63:0]usermessage;
wire [63:0]usercipher;
wire [63:0]encryptedusermessage;
wire [63:0]decryptedusermessage;

// Variables for the keyboard module

wire [4:0]char_count_1;
wire [4:0]char_count_2;
wire inputComplete;
wire refresh;

// Instantiate the data control for the keyboard module
// Ref: https://github.com/Zarci/DESEncryption_ECE287/blob/main/DESEncryption/inputControl.v
inputControl data_inst(clk, rst, keyclk, keydata, char_count_1, usermessage, char_count_2, usercipher, refresh, inputComplete);

output [6:0] seg7_dig0,seg7_dig1,seg7_dig2,seg7_dig3,seg7_dig4,seg7_dig5,seg7_dig6,seg7_dig7;

reg [3:0]digit0;
reg [3:0]digit1;
reg [3:0]digit2;
reg [3:0]digit3;
reg [3:0]digit4;
reg [3:0]digit5;
reg [3:0]digit6;
reg [3:0]digit7;

// Instansiate seven segment displays

sevenseg seg7_0(digit0,seg7_dig0);
sevenseg seg7_1(digit1,seg7_dig1);
sevenseg seg7_2(digit2,seg7_dig2);
sevenseg seg7_3(digit3,seg7_dig3);
sevenseg seg7_4(digit4,seg7_dig4);
sevenseg seg7_5(digit5,seg7_dig5);
sevenseg seg7_6(digit6,seg7_dig6);
sevenseg seg7_7(digit7,seg7_dig7);

// Instantiate encrpytion module(s)
encrypt encrypt_inst_0(message,cipher,encryptedmessage);
encrypt encrypt_inst_1(usermessage,usercipher,encryptedusermessage);

// Instantiate decryption module(s)
decrypt decrypt_inst_0(encryptedmessage,cipher,decryptedmessage);
decrypt decrypt_inst_1(encryptedusermessage,usercipher,decryptedusermessage);

always @(*)
	begin
		if (inputComplete == 1'b1)
			gled = 1'b1;
		else
			gled = 1'b0;
	end



/* always block for display choices */

always @ (display_control or encryptedmessage or decryptedmessage or encryptedusermessage or decryptedusermessage)
	case (display_control)
		3'b000: // <first 8 encrypt>
			begin
				digit0 = encryptedmessage[3:0];
				digit1 = encryptedmessage[7:4];
				digit2 = encryptedmessage[11:8];
				digit3 = encryptedmessage[15:12];
				digit4 = encryptedmessage[19:16];
				digit5 = encryptedmessage[23:20];
				digit6 = encryptedmessage[27:24];
				digit7 = encryptedmessage[31:28];
			end
		3'b001: // <second 8 encrypt>
			begin
				digit0 = encryptedmessage[35:32];
				digit1 = encryptedmessage[39:36];
				digit2 = encryptedmessage[43:40];
				digit3 = encryptedmessage[47:44];
				digit4 = encryptedmessage[51:48];
				digit5 = encryptedmessage[55:52];
				digit6 = encryptedmessage[59:56];
				digit7 = encryptedmessage[63:60];
			end
		3'b010: // <first 8 decrypt>
			begin
				digit0 = decryptedmessage[3:0];
				digit1 = decryptedmessage[7:4];
				digit2 = decryptedmessage[11:8];
				digit3 = decryptedmessage[15:12];
				digit4 = decryptedmessage[19:16];
				digit5 = decryptedmessage[23:20];
				digit6 = decryptedmessage[27:24];
				digit7 = decryptedmessage[31:28];
			end
		3'b011: // <second 8 decrypt>
			begin
				digit0 = decryptedmessage[35:32];
				digit1 = decryptedmessage[39:36];
				digit2 = decryptedmessage[43:40];
				digit3 = decryptedmessage[47:44];
				digit4 = decryptedmessage[51:48];
				digit5 = decryptedmessage[55:52];
				digit6 = decryptedmessage[59:56];
				digit7 = decryptedmessage[63:60];
			end
		3'b100: // <first 8 user encrypt>
			begin
				digit0 = encryptedusermessage[3:0];
				digit1 = encryptedusermessage[7:4];
				digit2 = encryptedusermessage[11:8];
				digit3 = encryptedusermessage[15:12];
				digit4 = encryptedusermessage[19:16];
				digit5 = encryptedusermessage[23:20];
				digit6 = encryptedusermessage[27:24];
				digit7 = encryptedusermessage[31:28];
			end
		3'b101: // <second 8 user encrypt>
			begin
				digit0 = encryptedusermessage[35:32];
				digit1 = encryptedusermessage[39:36];
				digit2 = encryptedusermessage[43:40];
				digit3 = encryptedusermessage[47:44];
				digit4 = encryptedusermessage[51:48];
				digit5 = encryptedusermessage[55:52];
				digit6 = encryptedusermessage[59:56];
				digit7 = encryptedusermessage[63:60];
			end
		3'b110: // <first 8 user decrypt>
			begin
				digit0 = decryptedusermessage[3:0];
				digit1 = decryptedusermessage[7:4];
				digit2 = decryptedusermessage[11:8];
				digit3 = decryptedusermessage[15:12];
				digit4 = decryptedusermessage[19:16];
				digit5 = decryptedusermessage[23:20];
				digit6 = decryptedusermessage[27:24];
				digit7 = decryptedusermessage[31:28];
			end
		3'b111: // <second 8 user decrypt>
			begin
				digit0 = decryptedusermessage[35:32];
				digit1 = decryptedusermessage[39:36];
				digit2 = decryptedusermessage[43:40];
				digit3 = decryptedusermessage[47:44];
				digit4 = decryptedusermessage[51:48];
				digit5 = decryptedusermessage[55:52];
				digit6 = decryptedusermessage[59:56];
				digit7 = decryptedusermessage[63:60];
			end
		default: // all displays 0
			begin
				digit0 = 4'd0;
				digit1 = 4'd1;
				digit2 = 4'd2;
				digit3 = 4'd3;
				digit4 = 4'd4;
				digit5 = 4'd5;
				digit6 = 4'd6;
				digit7 = 4'd7;
			end
	endcase

endmodule
