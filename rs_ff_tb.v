module rs_ff_tb;

  reg R, S, clk;
  wire Q, Qn;

  // Instantiate the RS flip-flop module
  rs_ff ff (Q, Qn, R, S, clk);

  initial begin
    // Apply test stimuli with various combinations of R, S, and clock
    clk = 0; #10; // Initialize clock low

    // Set (S=1, R=0)
    R = 0; S = 1; #20;
    $display("R=%b, S=%b | Q=%b, Qn=%b (Set)", R, S, Q, Qn);

    // Reset (S=0, R=1)
    S = 0; R = 1; #20;
    $display("R=%b, S=%b | Q=%b, Qn=%b (Reset)", R, S, Q, Qn);

    // Hold (S=0, R=0)
    R = 0; S = 0; #40;  // Apply longer pulse to show hold
    $display("R=%b, S=%b | Q=%b, Qn=%b (Hold)", R, S, Q, Qn);

    // Illegal (S=1, R=1)
    R = 1; S = 1; #20;
    $display("R=%b, S=%b | Q=%b, Qn=%b (Illegal)", R, S, Q, Qn);

    $finish;
  end

  always begin
    #10 clk = ~clk; // Toggle clock every 10ns
  end

endmodule
