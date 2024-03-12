module sar_adc_tb;

  reg analog_in, clk;
  wire [7:0] digital_out;
  wire done;

  // Instantiate the SAR ADC module
  sar_adc #(8) adc (analog_in, clk, digital_out, done);

  initial begin
    clk = 0; #10; // Initialize clock low

    // Apply various analog input values with error checking
    analog_in = 1'b0; #50; // 0 V
    $display("Analog Input: %b | Expected Output: %b", analog_in, 8'b00000000);
    @(posedge done);
    if (digital_out === 8'b00000000) begin
      $display("Conversion Done: Digital Output: %b (PASS)", digital_out);
    end else begin
      $display("Conversion Done: Digital Output: %b (FAIL - Expected %b)", digital_out, 8'b00000000);
    end

    analog_in = 1'b1; #50; // Vref (full scale)
    $display("Analog Input: %b | Expected Output: %b", analog_in, 8'b11111111);
    @(posedge done);
    if (digital_out === 8'b11111111) begin
      $display("Conversion Done: Digital Output: %b (PASS)", digital_out);
    end else begin
      $display("Conversion Done: Digital Output: %b (FAIL - Expected %b)", digital_out, 8'b11111111);
    end

    // Add multiple test points with mid-scale and other values
    // (adjust for your voltage range and expected outputs)
    analog_in = #(your_mid_scale_delay) 1'b0; // Mid-scale voltage
    // ... (similar structure for other test points)

    #100; // Wait for some additional clock cycles
    $finish;
  end

  always begin
    #10 clk = ~clk; // Toggle clock every 10ns
  end

endmodule
