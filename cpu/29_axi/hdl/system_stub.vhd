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
    led_0_ledd_pin : out std_logic_vector(7 downto 0);
    CLK : in std_logic;
    MYCLK : in std_logic;
    usart_tx1_0_tx_pin_pin : out std_logic;
    usart_tx1_0_clock_pin : in std_logic;
    usart_tx1_0_reset_pin : in std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      RESET : in std_logic;
      led_0_ledd_pin : out std_logic_vector(7 downto 0);
      CLK : in std_logic;
      MYCLK : in std_logic;
      usart_tx1_0_tx_pin_pin : out std_logic;
      usart_tx1_0_clock_pin : in std_logic;
      usart_tx1_0_reset_pin : in std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      RESET => RESET,
      led_0_ledd_pin => led_0_ledd_pin,
      CLK => CLK,
      MYCLK => MYCLK,
      usart_tx1_0_tx_pin_pin => usart_tx1_0_tx_pin_pin,
      usart_tx1_0_clock_pin => usart_tx1_0_clock_pin,
      usart_tx1_0_reset_pin => usart_tx1_0_reset_pin
    );

end architecture STRUCTURE;

