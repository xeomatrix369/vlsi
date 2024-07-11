module d_ff_tb;

  reg D, clk;
  wire Q;

  // Instantiate the D flip-flop module
  d_ff ff (Q, D, clk);

  initial begin
    // Apply test stimuli with various data and clock signals
    clk = 0; #10; // Initialize clock low

    // Apply data changes at clock edges
    D = 0; #20; clk = 1; #10; clk = 0; // Capture 0 on first edge
    $display("D=%b | Q=%b (Capture 0)", D, Q);

    D = 1; #20; clk = 1; #10; clk = 0; // Capture 1 on second edge
    $display("D=%b | Q=%b (Capture 1)", D, Q);

    #40; // Wait for multiple clock cycles (no change)
    $display("D=%b | Q=%b (Hold)", D, Q);

    $finish;
  end

  always begin
    #10 clk = ~clk; // Toggle clock every 10ns
  end

endmodule
