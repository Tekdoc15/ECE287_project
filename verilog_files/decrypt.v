module decrypt(
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


// Instantiate pc-1 algorithm and generate first subkey
pcone pcuno(key,subkeyprime);

// Instantiate and generate subkeys
subkeyshift subkeys(subkeyprime,subkey1,subkey2,subkey3,subkey4,subkey5,subkey6,subkey7,subkey8,subkey9,subkey10,subkey11,subkey12,subkey13,subkey14,subkey15,subkey16);

// Instantiate pc-2 algrithm and generate 16 keys with it
pctwo generate1(subkey1,pc2subkey1);
pctwo generate2(subkey2,pc2subkey2);
pctwo generate3(subkey3,pc2subkey3);
pctwo generate4(subkey4,pc2subkey4);
pctwo generate5(subkey5,pc2subkey5);
pctwo generate6(subkey6,pc2subkey6);
pctwo generate7(subkey7,pc2subkey7);
pctwo generate8(subkey8,pc2subkey8);
pctwo generate9(subkey9,pc2subkey9);
pctwo generate10(subkey10,pc2subkey10);
pctwo generate11(subkey11,pc2subkey11);
pctwo generate12(subkey12,pc2subkey12);
pctwo generate13(subkey13,pc2subkey13);
pctwo generate14(subkey14,pc2subkey14);
pctwo generate15(subkey15,pc2subkey15);
pctwo generate16(subkey16,pc2subkey16);

wire [31:0]fendcode_1;
wire [31:0]fendcode_2;
wire [31:0]fendcode_3;
wire [31:0]fendcode_4;
wire [31:0]fendcode_5;
wire [31:0]fendcode_6;
wire [31:0]fendcode_7;
wire [31:0]fendcode_8;
wire [31:0]fendcode_9;
wire [31:0]fendcode_10;
wire [31:0]fendcode_11;
wire [31:0]fendcode_12;
wire [31:0]fendcode_13;
wire [31:0]fendcode_14;
wire [31:0]fendcode_15;
wire [31:0]fendcode_16;

//create wires for each of the left and right sides
wire [31:0]message_ip_left_0 = message_ip[63:32];
wire [31:0]message_ip_right_0 = message_ip[31:0];
wire [31:0]message_ip_left_1 = message_ip[31:0];
wire [31:0]message_ip_right_1 = message_ip_left_0 ^ fendcode_1;
wire [31:0]message_ip_left_2 = message_ip_right_1;
wire [31:0]message_ip_right_2 = message_ip_left_1 ^ fendcode_2;
wire [31:0]message_ip_left_3 = message_ip_right_2;
wire [31:0]message_ip_right_3 = message_ip_left_2 ^ fendcode_3;
wire [31:0]message_ip_left_4 = message_ip_right_3;
wire [31:0]message_ip_right_4 = message_ip_left_3 ^ fendcode_4;
wire [31:0]message_ip_left_5 = message_ip_right_4;
wire [31:0]message_ip_right_5 = message_ip_left_4 ^ fendcode_5;
wire [31:0]message_ip_left_6 = message_ip_right_5;
wire [31:0]message_ip_right_6 = message_ip_left_5 ^ fendcode_6;
wire [31:0]message_ip_left_7 = message_ip_right_6;
wire [31:0]message_ip_right_7 = message_ip_left_6 ^ fendcode_7;
wire [31:0]message_ip_left_8 = message_ip_right_7;
wire [31:0]message_ip_right_8 = message_ip_left_7 ^ fendcode_8;
wire [31:0]message_ip_left_9 = message_ip_right_8;
wire [31:0]message_ip_right_9 = message_ip_left_8 ^ fendcode_9;
wire [31:0]message_ip_left_10 = message_ip_right_9;
wire [31:0]message_ip_right_10 = message_ip_left_9 ^ fendcode_10;
wire [31:0]message_ip_left_11 = message_ip_right_10;
wire [31:0]message_ip_right_11 = message_ip_left_10 ^ fendcode_11;
wire [31:0]message_ip_left_12 = message_ip_right_11;
wire [31:0]message_ip_right_12 = message_ip_left_11 ^ fendcode_12;
wire [31:0]message_ip_left_13 = message_ip_right_12;
wire [31:0]message_ip_right_13 = message_ip_left_12 ^ fendcode_13;
wire [31:0]message_ip_left_14 = message_ip_right_13;
wire [31:0]message_ip_right_14 = message_ip_left_13 ^ fendcode_14;
wire [31:0]message_ip_left_15 = message_ip_right_14;
wire [31:0]message_ip_right_15 = message_ip_left_14 ^ fendcode_15;
wire [31:0]message_ip_left_16 = message_ip_right_15;
wire [31:0]message_ip_right_16 = message_ip_left_15 ^ fendcode_16;

// Instantiate fencode a bunch to generate the ip_right values
fencode fencode_inst_1(message_ip_right_0,pc2subkey16,fendcode_1);
fencode fencode_inst_2(message_ip_right_1,pc2subkey15,fendcode_2);
fencode fencode_inst_3(message_ip_right_2,pc2subkey14,fendcode_3);
fencode fencode_inst_4(message_ip_right_3,pc2subkey13,fendcode_4);
fencode fencode_inst_5(message_ip_right_4,pc2subkey12,fendcode_5);
fencode fencode_inst_6(message_ip_right_5,pc2subkey11,fendcode_6);
fencode fencode_inst_7(message_ip_right_6,pc2subkey10,fendcode_7);
fencode fencode_inst_8(message_ip_right_7,pc2subkey9,fendcode_8);
fencode fencode_inst_9(message_ip_right_8,pc2subkey8,fendcode_9);
fencode fencode_inst_10(message_ip_right_9,pc2subkey7,fendcode_10);
fencode fencode_inst_11(message_ip_right_10,pc2subkey6,fendcode_11);
fencode fencode_inst_12(message_ip_right_11,pc2subkey5,fendcode_12);
fencode fencode_inst_13(message_ip_right_12,pc2subkey4,fendcode_13);
fencode fencode_inst_14(message_ip_right_13,pc2subkey3,fendcode_14);
fencode fencode_inst_15(message_ip_right_14,pc2subkey2,fendcode_15);
fencode fencode_inst_16(message_ip_right_15,pc2subkey1,fendcode_16);

// recombine the message halves, but backwards
wire [63:0]recombine_message = {message_ip_right_16,message_ip_left_16};

// finally run it through a inverse IP table

ipinverse ipinverse_inst(recombine_message,encryptmessage);

endmodule

