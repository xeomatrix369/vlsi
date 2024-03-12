module transmission_gate_tb;

  reg in;
  reg control;
  wire out;

  // Instantiate the transmission gate module
  transmission_gate tx_gate (out, in, control);

  initial begin
    // Apply test stimuli
    in = 0; control = 1; #10; // Apply 0 with control high for 10ns
    $display("Input = %b, Control = %b, Output = %b", in, control, out);

    in = 1; control = 1; #20; // Apply 1 with control high for 20ns
    $display("Input = %b, Control = %b, Output = %b", in, control, out);

    in = 0; control = 0; #30; // Apply 0 with control low (high-impedance)
    $display("Input = %b, Control = %b, Output = %b (High-Z)", in, control, out);

    $finish;
  end

endmodule
