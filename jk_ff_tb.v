module jk_ff_tb;

  reg J, K, clk;
  wire Q, Qn;

  // Instantiate the JK flip-flop module
  jk_ff ff (Q, Qn, J, K, clk);

  initial begin
    // Apply test stimuli with various combinations of J, K, and clock
    clk = 0; #10; // Initialize clock low

    // Test cases for J, K
    J = 0; K = 0; #20; clk = 1; #10; clk = 0; // Hold (J=K=0)
    $display("J=%b, K=%b | Q=%b, Qn=%b (Hold)", J, K, Q, Qn);

    J = 0; K = 1; #20; clk = 1; #10; clk = 0; // Reset (K=1)
    $display("J=%b, K=%b | Q=%b, Qn=%b (Reset)", J, K, Q, Qn);

    J = 1; K = 0; #20; clk = 1; #10; clk = 0; // Set (J=1)
    $display("J=%b, K=%b | Q=%b, Qn=%b (Set)", J, K, Q, Qn);

    J = 1; K = 1; #40; clk = 1; #10; clk = 0; clk = 1; #10; clk = 0; // Toggle (J=K=1)
    $display("J=%b, K=%b | Q=%b, Qn=%b (Toggle)", J, K, Q, Qn);

    $finish;
  end

  always begin
    #10 clk = ~clk; // Toggle clock every 10ns
  end

endmodule
