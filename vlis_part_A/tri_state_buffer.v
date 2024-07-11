module tristate_buffer (
  input in,
  input en,
  output out
);

  assign out = en ? in : 1'bZ;

endmodule
