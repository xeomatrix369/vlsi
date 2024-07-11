module serial_adder_tb;

  reg inA, inB, clk;
  wire sum, carry_out;

  // Instantiate the serial adder module
  serial_adder adder (sum, carry_out, inA, inB, clk);

  initial begin
    // Apply test stimuli with various input combinations
    clk = 0; #10; // Initialize clock low

    // Test cases for addition (inA, inB, expected sum, carry_out)
    inA = 0; inB = 0; #20; clk = 1; #10; clk = 0; // 0 + 0 = 0, carry_out = 0
    $display("inA=%b, inB=%b | sum=%b, carry_out=%b", inA, inB, sum, carry_out);

    inA = 0; inB = 1; #20; clk = 1; #10; clk = 0; // 0 + 1 = 1, carry_out = 0
    $display("inA=%b, inB=%b | sum=%b, carry_out=%b", inA, inB, sum, carry_out);

    inA = 1; inB = 0; #20; clk = 1; #10; clk = 0; // 1 + 0 = 1, carry_out = 0
    $display("inA=%b, inB=%b | sum=%b, carry_out=%b", inA, inB, sum, carry_out);

    inA = 1; inB = 1; #40; clk = 1; #10; clk = 0; clk = 1; #10; clk = 0; // 1 + 1 = 0, carry_out = 1
    $display("inA=%b, inB=%b | sum=%b, carry_out=%b", inA, inB, sum, carry_out);

    $finish;
  end

  always begin
    #10 clk = ~clk; // Toggle clock every 10ns
  end

endmodule
