module encrypt (
input [63:0]message,
input [63:0]key,
output [63:0]encryptmessage
);

wire [55:0]subkeyprime;
wire [55:0]subkey1;
wire [55:0]subkey2;
wire [55:0]subkey3;
wire [55:0]subkey4;
wire [55:0]subkey5;
wire [55:0]subkey6;
wire [55:0]subkey7;
wire [55:0]subkey8;
wire [55:0]subkey9;
wire [55:0]subkey10;
wire [55:0]subkey11;
wire [55:0]subkey12;
wire [55:0]subkey13;
wire [55:0]subkey14;
wire [55:0]subkey15;
wire [55:0]subkey16;

wire [47:0]pc2subkey1;
wire [47:0]pc2subkey2;
wire [47:0]pc2subkey3;
wire [47:0]pc2subkey4;
wire [47:0]pc2subkey5;
wire [47:0]pc2subkey6;
wire [47:0]pc2subkey7;
wire [47:0]pc2subkey8;
wire [47:0]pc2subkey9;
wire [47:0]pc2subkey10;
wire [47:0]pc2subkey11;
wire [47:0]pc2subkey12;
wire [47:0]pc2subkey13;
wire [47:0]pc2subkey14;
wire [47:0]pc2subkey15;
wire [47:0]pc2subkey16;

reg [63:0]tempmessage;

//instantiate pc-1 algorithm and generate first subkey
pcone pcuno(clk,rst,key,subkeyprime);

// instantiate and generate subkeys
subkeyshift subkeys(clk,rst,subkeyprime,subkey1,subkey2,subkey3,subkey4,subkey5,subkey6,subkey7,subkey8,subkey9,subkey10,subkey11,subkey12,subkey13,subkey14,subkey15,subkey16);

// instantiate pc-2 algrithm and generate 16 keys with it
pctwo generate1(clk,rst,subkey1,pc2subkey1);
pctwo generate2(clk,rst,subkey2,pc2subkey2);
pctwo generate3(clk,rst,subkey3,pc2subkey3);
pctwo generate4(clk,rst,subkey4,pc2subkey4);
pctwo generate5(clk,rst,subkey5,pc2subkey5);
pctwo generate6(clk,rst,subkey6,pc2subkey6);
pctwo generate7(clk,rst,subkey7,pc2subkey7);
pctwo generate8(clk,rst,subkey8,pc2subkey8);
pctwo generate9(clk,rst,subkey9,pc2subkey9);
pctwo generate10(clk,rst,subkey10,pc2subkey10);
pctwo generate11(clk,rst,subkey11,pc2subkey11);
pctwo generate12(clk,rst,subkey12,pc2subkey12);
pctwo generate13(clk,rst,subkey13,pc2subkey13);
pctwo generate14(clk,rst,subkey14,pc2subkey14);
pctwo generate15(clk,rst,subkey15,pc2subkey15);
pctwo generate16(clk,rst,subkey16,pc2subkey16);

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

always @(*)
	begin
		tempmessage = {message[58],message[50],message[42],message[34],message[26],message[18],message[10],message[2],message[60],message[52],message[44],message[36],message[28],message[12],message[4],message[62],message[54],message[46],message[38],message[30],message[22],message[14],message[6],message[64],message[56],message[48],message[40],message[32],message[24],message[16],message[8],message[57],message[49],message[41],message[33],message[25],message[17],message[9],message[1],message[59],message[51],message[43],message[35],message[27],message[19],message[11],message[3],message[61],message[53],message[45],message[37],message[29],message[21],message[13],message[5],message[63],message[55],message[47],message[39],message[31],message[23],message[15],message[7]};
	end



endmodule
