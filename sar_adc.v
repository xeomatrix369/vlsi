module sar_adc #(
  parameter integer N = 8  // Number of bits (resolution)
) (
  input analog_in, // Analog input signal
  input clk,
  output reg [N-1:0] digital_out,
  output reg done
);

  // Internal variables
  reg [N-1:0] dac_code;  // Digital to Analog Converter (DAC) code
  reg [N-1:0] comparator_out;

  // Reference voltage (can be replaced with external logic)
  wire Vref = 1'b1;  // Adjust for your reference voltage range

  // DAC (replace with your specific DAC implementation)
  // This is a simplified example assuming a thermometer code DAC
  always @(dac_code) begin
    for (int i = 0; i < N; i = i + 1) begin
      comparator_out[i] = analog_in > (Vref * dac_code[i]);
    end
  end

  // SAR logic
  always @(posedge clk) begin
    dac_code <= N'b0;  // Initialize DAC code to 0
    done <= 1'b0;     // Initially not done with conversion

    for (int i = N-1; i >= 0; i = i - 1) begin
      if (comparator_out[i]) begin
        dac_code[i] <= 1'b1;
      end else begin
        dac_code[i] <= 1'b0;
        // Early exit if MSB is already compared (optimization)
        if (i == 0) begin
          done <= 1'b1;
        end
      end
      @(posedge clk);
    end

    done <= 1'b1;  // Conversion finished after the loop
  end

  // Assign digital output
  always @(dac_code) begin
    digital_out <= dac_code;
  end

endmodule
