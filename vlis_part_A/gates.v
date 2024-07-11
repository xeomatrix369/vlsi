// Module for basic and universal gates

module gates (
  input a, b,
  output out_not, out_and, out_or, out_nand, out_nor, out_xor, out_xnor
);

  // Inverter (NOT)
  assign out_not = ~a;

  // AND gate
  assign out_and = a & b;

  // OR gate
  assign out_or = a | b;

  // NAND gate (derived from AND and NOT)
  assign out_nand = ~(a & b);

  // NOR gate (derived from OR and NOT)
  assign out_nor = ~(a | b);

  // XOR gate
  assign out_xor = a ^ b;

  // XNOR gate (derived from XOR and NOT)
  assign out_xnor = ~(a ^ b);

endmodule


