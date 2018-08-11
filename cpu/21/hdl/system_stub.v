//-----------------------------------------------------------------------------
// system_stub.v
//-----------------------------------------------------------------------------

module system_stub
  (
    fpga_0_clk_1_sys_clk_pin,
    fpga_0_rst_1_sys_rst_pin,
    usart_0_led_pin,
    usart_0_tx_pin_pin,
    usart_0_clock_pin
  );
  input fpga_0_clk_1_sys_clk_pin;
  input fpga_0_rst_1_sys_rst_pin;
  output usart_0_led_pin;
  output usart_0_tx_pin_pin;
  input usart_0_clock_pin;

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .fpga_0_clk_1_sys_clk_pin ( fpga_0_clk_1_sys_clk_pin ),
      .fpga_0_rst_1_sys_rst_pin ( fpga_0_rst_1_sys_rst_pin ),
      .usart_0_led_pin ( usart_0_led_pin ),
      .usart_0_tx_pin_pin ( usart_0_tx_pin_pin ),
      .usart_0_clock_pin ( usart_0_clock_pin )
    );

endmodule

module system
  (
    fpga_0_clk_1_sys_clk_pin,
    fpga_0_rst_1_sys_rst_pin,
    usart_0_led_pin,
    usart_0_tx_pin_pin,
    usart_0_clock_pin
  );
  input fpga_0_clk_1_sys_clk_pin;
  input fpga_0_rst_1_sys_rst_pin;
  output usart_0_led_pin;
  output usart_0_tx_pin_pin;
  input usart_0_clock_pin;
endmodule

