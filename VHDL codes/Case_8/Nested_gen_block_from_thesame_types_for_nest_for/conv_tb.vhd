LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

 
ENTITY conv_tb IS
END conv_tb;
 
ARCHITECTURE behavior OF conv_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT conv_3x3
    PORT(
        -- clk : IN  std_logic;
         --rst : IN  std_logic;
         Input_Data : IN  std_logic_vector(11 downto 0);
         Input_Weight : IN  std_logic_vector(35 downto 0);
         output_Data : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   --signal clk : std_logic := '0';
   --signal rst : std_logic := '0';
   signal Input_Data : std_logic_vector(11 downto 0) := (others => '0');
   signal Input_Weight : std_logic_vector(35 downto 0) := (others => '0');

 	--Outputs
   signal output_Data : std_logic_vector(23 downto 0);

 signal clk : std_logic:= '0';
 

 
BEGIN 
clk <= not clk after 10 ns ;


 
	-- Instantiate the Unit Under Test (UUT)
   uut: conv_3x3 PORT MAP (
          --clk => clk,
          --rst => rst,
          Input_Data => Input_Data,
          Input_Weight => Input_Weight,
          output_Data => output_Data
        );

	    -- psl default clock is rising_edge(clk);
		 --psl assert always (unsigned(output_Data(7 downto 0)) =  unsigned(Input_Data( 3 downto 0))*unsigned(Input_Weight	(3 downto 0))+unsigned(Input_Data(7 downto 4))*unsigned(Input_Weight	(7 downto 4))+ unsigned(Input_Data(11 downto 8))*unsigned(Input_Weight(11 downto 8)));


process 
begin
Input_Data <=x"123";
wait;
end process;

process 
begin
Input_Weight <=x"123123123";
wait;
end process;

END;
