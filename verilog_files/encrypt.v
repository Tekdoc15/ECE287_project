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

wire [63:0] message_ip;

// Instantiate dataip bit swap
dataip dataip_inst(message,message_ip);


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




endmodule
