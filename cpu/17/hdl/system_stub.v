//-----------------------------------------------------------------------------
// system_stub.v
//-----------------------------------------------------------------------------

module system_stub
  (
    fpga_0_clk_1_sys_clk_pin,
    fpga_0_rst_1_sys_rst_pin
  );
  input fpga_0_clk_1_sys_clk_pin;
  input fpga_0_rst_1_sys_rst_pin;

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .fpga_0_clk_1_sys_clk_pin ( fpga_0_clk_1_sys_clk_pin ),
      .fpga_0_rst_1_sys_rst_pin ( fpga_0_rst_1_sys_rst_pin )
    );

endmodule

module system
  (
    fpga_0_clk_1_sys_clk_pin,
    fpga_0_rst_1_sys_rst_pin
  );
  input fpga_0_clk_1_sys_clk_pin;
  input fpga_0_rst_1_sys_rst_pin;
endmodule

