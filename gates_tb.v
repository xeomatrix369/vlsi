// Testbench module for all gates

module gates_tb;

  reg in1, in2;
  wire out_not, out_and, out_or, out_nand, out_nor, out_xor, out_xnor;

  // Instantiate the gates module
  gates gate_unit (out_not, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

  initial begin
    // Apply test stimuli for each gate
    in1 = 0; in2 = 0; #10;
    $display("Inputs: %b %b | NOT: %b, AND: %b, OR: %b, NAND: %b, NOR: %b, XOR: %b, XNOR: %b", in1, in2, out_not, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

    in1 = 0; in2 = 1; #10;
    $display("Inputs: %b %b | NOT: %b, AND: %b, OR: %b, NAND: %b, NOR: %b, XOR: %b, XNOR: %b", in1, in2, out_not, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

    in1 = 1; in2 = 0; #10;
    $display("Inputs: %b %b | NOT: %b, AND: %b, OR: %b, NAND: %b, NOR: %b, XOR: %b, XNOR: %b", in1, in2, out_not, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

    in1 = 1; in2 = 1; #10;
    $display("Inputs: %b %b | NOT: %b, AND: %b, OR: %b, NAND: %b, NOR: %b, XOR: %b, XNOR: %b", in1, in2, out_not, out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

    $finish;
  end

endmodule
