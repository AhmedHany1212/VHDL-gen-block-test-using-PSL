library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_lift_nested_for_if is
 port(
	 clk, rst : in std_logic;
	 Input_Data: in std_logic;
	 Q: out std_logic_vector(3 downto 0)
	 );
end shift_lift_nested_for_if;

architecture Behavioral of shift_lift_nested_for_if is

	signal Shift_Lift : std_logic_vector(3 downto 0) ;
	component D_FF
		port(D, CLK_S,rst_D : in std_logic; Q:out std_logic);
	end component D_FF;
	
begin


	shift_loop : for i in 0 to 3 generate
		shif_lift_exept_0: if (i<=3 and i>0) generate
			D_Flip_Flop : D_FF port map(Shift_Lift(i-1), clk,rst, Shift_Lift(i));
		end generate shif_lift_exept_0 ;
		shif_lift_0: if (i=0) generate
			D_Flip_Flop : D_FF port map(Input_Data, clk,rst, Shift_Lift(i));
		end generate shif_lift_0 ;
	end generate shift_loop;
	Q <= Shift_Lift;

end Behavioral;

