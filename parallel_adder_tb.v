module parallel_adder_tb;

  reg [3:0] A, B;
  wire [3:0] sum;
  wire carry_out;

  // Instantiate the parallel adder module
  parallel_adder adder (sum, carry_out, A, B);

  initial begin
    // Apply test stimuli with various input combinations
    A = 4'b0000; B = 4'b0000; #20; // 0 + 0 = 0
    $display("A=%b, B=%b | sum=%b, carry_out=%b", A, B, sum, carry_out);

    A = 4'b0001; B = 4'b0001; #20; // 1 + 1 = 0 (carry_out=1)
    $display("A=%b, B=%b | sum=%b, carry_out=%b", A, B, sum, carry_out);

    A = 4'b1010; B = 4'b0101; #20; // 10 + 5 = 15
    $display("A=%b, B=%b | sum=%b, carry_out=%b", A, B, sum, carry_out);

    A = 4'b1111; B = 4'b1111; #20; // 15 + 15 = 30 (carry_out=1)
    $display("A=%b, B=%b | sum=%b, carry_out=%b", A, B, sum, carry_out);

    $finish;
  end

endmodule
