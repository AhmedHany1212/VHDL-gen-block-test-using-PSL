library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
port (D,CLK_S,rst_D : in std_logic;
      Q : out std_logic := '0');
end entity D_FF;

architecture Behavioral of D_FF is

begin
D_FF_Process: process(CLK_S,rst_D)
   begin
	if (rst_D='1')
	        then Q <= '0';
     elsif CLK_S = '1' and CLK_S'Event
        then Q <= D;
     end if;
  end process;
end architecture Behavioral;
