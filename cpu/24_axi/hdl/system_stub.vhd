-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    RESET : in std_logic;
    CLK_P : in std_logic;
    CLK_N : in std_logic;
    usart_0_led_pin : out std_logic;
    usart_0_tx_pin_pin : out std_logic;
    usart_0_clock_pin : in std_logic;
    usart_0_reset_pin : in std_logic;
    led_0_ledd_pin : out std_logic_vector(7 downto 0)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      RESET : in std_logic;
      CLK_P : in std_logic;
      CLK_N : in std_logic;
      usart_0_led_pin : out std_logic;
      usart_0_tx_pin_pin : out std_logic;
      usart_0_clock_pin : in std_logic;
      usart_0_reset_pin : in std_logic;
      led_0_ledd_pin : out std_logic_vector(7 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      RESET => RESET,
      CLK_P => CLK_P,
      CLK_N => CLK_N,
      usart_0_led_pin => usart_0_led_pin,
      usart_0_tx_pin_pin => usart_0_tx_pin_pin,
      usart_0_clock_pin => usart_0_clock_pin,
      usart_0_reset_pin => usart_0_reset_pin,
      led_0_ledd_pin => led_0_ledd_pin
    );

end architecture STRUCTURE;

