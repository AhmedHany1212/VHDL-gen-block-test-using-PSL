library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_lift_seq is
 port(
 clk, rst : in std_logic;
 Input_Data: in std_logic;
 Q: out std_logic_vector(3 downto 0) );
end shift_lift_seq;

architecture Behavioral of shift_lift_seq is

 signal Shift_reg : std_logic_vector(3 downto 0) := "0000";
begin

 D_FF1: process(clk,rst)
   begin
	 if(rst='1') then
		Shift_reg(0) <= '0';
     elsif clk = '1' and clk'Event
        then Shift_reg(0) <= Input_Data;
     end if;
  end process D_FF1;
  
 shift_lift_gen : for i in 1 to 3 generate
 D_FF2: process(clk,rst)
   begin
	 if(rst='1') then
		Shift_reg(i) <= '0';
     elsif clk = '1' and clk'Event
        then Shift_reg(i) <= Shift_reg(i-1);
     end if;
  end process D_FF2;
 end generate shift_lift_gen;
 
 Q <= Shift_reg;

end Behavioral;

