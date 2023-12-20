


module decoder1035 (output out, input [15:0] entrada);

  assign out = entrada[0] & entrada[1] & ~entrada[2] & entrada[3] & ~entrada[4] & ~entrada[5] & ~entrada[6] & ~entrada[7] & ~entrada[8] & ~entrada[9] & entrada[10] & ~entrada[11] & ~entrada[12] & ~entrada[13] & ~entrada[14] & ~entrada[15];

endmodule





