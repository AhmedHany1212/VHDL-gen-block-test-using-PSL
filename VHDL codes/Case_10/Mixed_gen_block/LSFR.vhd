library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LSFR is
 port(
 clk, rst : in std_logic;
 Q: out std_logic_vector(3 downto 0) );
end LSFR;

architecture Behavioral of LSFR is

	signal Shift_reg : std_logic_vector(3 downto 0) :="1111" ;
	signal xor_out : std_logic ;
	component D_FF
		port(D, CLK_S,rst_D : in std_logic; Q:out std_logic);
	end component D_FF;

begin

	LFSR_Loop : for i in 0 to 3 generate
		LFSR_exept_0: if (i<=3 and i>0) generate
			D_Flip_Flop : D_FF port map(Shift_reg(i-1), clk,rst, Shift_reg(i));
		end generate LFSR_exept_0 ;
		LFSR_0: if (i=0) generate
			xor_out <= Shift_reg(i+2) xor Shift_reg(i+3);
			D_Flip_Flop : D_FF port map(xor_out, clk,rst, Shift_reg(i));
		end generate LFSR_0 ;
	end generate LFSR_Loop;
	Q <= Shift_reg;
	
end Behavioral;

