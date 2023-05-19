library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity conv_3x3 is
	Generic (filter_num: integer :=3;
				ch_num: integer :=3);

	port(
		--clk, rst : in std_logic;
		Input_Data: in std_logic_vector(ch_num*4-1 downto 0);
		Input_Weight: in std_logic_vector(filter_num*ch_num*4-1 downto 0);
		output_Data: out std_logic_vector(filter_num*8-1 downto 0) 
		);

end conv_3x3;

architecture Behavioral of conv_3x3 is
	signal output_Data_signal : std_logic_vector (filter_num*4-1 downto 0) := x"000";
	signal output_mul : std_logic_vector (filter_num*ch_num*8-1 downto 0) ;

begin


	filters_loop : for i in 0 to filter_num-1 generate
		channels_loop : for j in 0 to ch_num-1 generate
			output_mul((j+1)*8+8*ch_num*(i)-1 downto j*8+8*ch_num*i )<= 
			std_logic_vector(unsigned(Input_Data((j+1)*4-1 downto j*4 )) 
			* unsigned(Input_Weight((j+1)*4+4*ch_num*(i)-1 downto j*4+4*ch_num*i ))); 	 
		end generate channels_loop;
		output_Data(8*(i+1)-1 downto 8*i) <=output_mul( i*ch_num*8+7 downto i*ch_num*8)
		+output_mul(i*ch_num*8+15 downto i*ch_num*8+8)
		+output_mul(i*ch_num*8+23 downto i*ch_num*8+16);
	end generate filters_loop;

end Behavioral;

