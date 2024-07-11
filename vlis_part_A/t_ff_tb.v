module t_ff_tb;

  reg T, clk;
  wire Q, Qn;

  // Instantiate the T flip-flop module
  t_ff ff (Q, Qn, T, clk);

  initial begin
    // Apply test stimuli with T signal at different clock edges
    clk = 0; #10; // Initialize clock low

    // Toggle on every positive edge where T is high
    T = 0; #20; clk = 1; #10; clk = 0; // No change (T=0)
    $display("T=%b | Q=%b, Qn=%b (No Change - T=0)", T, Q, Qn);

    T = 1; #20; clk = 1; #10; clk = 0; // Toggle (T=1)
    $display("T=%b | Q=%b, Qn=%b (Toggle)", T, Q, Qn);

    T = 1; #40; clk = 1; #10; clk = 0; // Toggle again (T=1)
    $display("T=%b | Q=%b, Qn=%b (Toggle)", T, Q, Qn);

    T = 0; #20; // T can change between clock edges

    $finish;
  end

  always begin
    #10 clk = ~clk; // Toggle clock every 10ns
  end

endmodule
