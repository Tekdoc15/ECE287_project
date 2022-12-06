module fencode(
input [31:0]message_ipright,
input [47:0]pc2subkey,
output [31:0]fofrenc
);

// Instantiate and process r through e
wire [47:0] ipright_expanded;
E e_inst(message_ipright,ipright_expanded);

wire [47:0]temp = ipright_expanded ^ pc2subkey;

wire [5:0]S1_in = temp[47:42];
wire [5:0]S2_in = temp[41:36];
wire [5:0]S3_in = temp[35:30];
wire [5:0]S4_in = temp[29:24];
wire [5:0]S5_in = temp[23:18];
wire [5:0]S6_in = temp[17:12];
wire [5:0]S7_in = temp[11:6];
wire [5:0]S8_in = temp[5:0];

wire [3:0]S1_out;
wire [3:0]S2_out;
wire [3:0]S3_out;
wire [3:0]S4_out;
wire [3:0]S5_out;
wire [3:0]S6_out;
wire [3:0]S7_out;
wire [3:0]S8_out;

// Instantiate each of the S box modules and run it against appropriate segment of temp
S1 s1_inst(S1_in, S1_out);
S2 s2_inst(S2_in, S2_out);
S3 s3_inst(S3_in, S3_out);
S4 s4_inst(S4_in, S4_out);
S5 s5_inst(S5_in, S5_out);
S6 s6_inst(S6_in, S6_out);
S7 s7_inst(S7_in, S7_out);
S8 s8_inst(S8_in, S8_out);

wire [31:0]Sout = {S1_out,S2_out,S3_out,S4_out,S5_out,S6_out,S7_out,S8_out};

// Instantiate P and process the output of the Sboxes
P p_inst(Sout,fofrenc);

endmodule

