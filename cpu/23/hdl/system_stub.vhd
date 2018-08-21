-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic;
    led_k_0_ledd_pin : out std_logic_vector(7 downto 0);
    usart_0_reset_pin : in std_logic;
    usart_0_led_pin : out std_logic;
    usart_0_tx_pin_pin : out std_logic;
    usart_0_clock_pin : in std_logic;
    i2c_software_master_0_sda_pin_pin : inout std_logic;
    i2c_software_master_0_scl_pin_pin : inout std_logic;
    timer_0_reset_pin : in std_logic;
    timer_0_clock_pin : in std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      fpga_0_clk_1_sys_clk_pin : in std_logic;
      fpga_0_rst_1_sys_rst_pin : in std_logic;
      led_k_0_ledd_pin : out std_logic_vector(7 downto 0);
      usart_0_reset_pin : in std_logic;
      usart_0_led_pin : out std_logic;
      usart_0_tx_pin_pin : out std_logic;
      usart_0_clock_pin : in std_logic;
      i2c_software_master_0_sda_pin_pin : inout std_logic;
      i2c_software_master_0_scl_pin_pin : inout std_logic;
      timer_0_reset_pin : in std_logic;
      timer_0_clock_pin : in std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
      fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin,
      led_k_0_ledd_pin => led_k_0_ledd_pin,
      usart_0_reset_pin => usart_0_reset_pin,
      usart_0_led_pin => usart_0_led_pin,
      usart_0_tx_pin_pin => usart_0_tx_pin_pin,
      usart_0_clock_pin => usart_0_clock_pin,
      i2c_software_master_0_sda_pin_pin => i2c_software_master_0_sda_pin_pin,
      i2c_software_master_0_scl_pin_pin => i2c_software_master_0_scl_pin_pin,
      timer_0_reset_pin => timer_0_reset_pin,
      timer_0_clock_pin => timer_0_clock_pin
    );

end architecture STRUCTURE;

