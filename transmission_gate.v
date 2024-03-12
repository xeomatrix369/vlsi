module transmission_gate (
  input in,
  input control,
  output out
);

  assign out = control ? in : 1'bZ;  // Similar to tri-state buffer for control

endmodule
