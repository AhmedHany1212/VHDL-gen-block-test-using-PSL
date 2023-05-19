LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
 
ENTITY simple_adder_tb IS
END simple_adder_tb;
 
ARCHITECTURE behavior OF simple_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT simple_adder
    PORT(
		A,B: in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		Cout: out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := "0000";
   signal B : std_logic_vector(3 downto 0) := "0000";
   signal Cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
signal clk : std_logic:= '0';
 

 
BEGIN 
clk <= not clk after 50 ns ;

	-- Instantiate the Unit Under Test (UUT)
   uut: simple_adder 
   PORT MAP (
			A => A,
			B => B,
			Cin => Cin,
			Cout => Cout,
			sum => sum
				);
     -- psl default clock is rising_edge(clk);
	  --psl property simple_adder_prop is always (sum=(A)+(B)+(Cin));
	  --psl assert simple_adder_prop;
     --    report "failed addition";


	
	process 
	begin
		A <="0100";
		wait for 100 ns;
		A <="0101";
		wait for 100 ns;
		A <="0111";
		wait for 100 ns;

	end process;
	
	process 
	begin
		B <="0100";
		wait for 100 ns;
		B <="0101";
		wait for 100 ns;
		B <="0111";
		wait for 100 ns;
	end process;
	
	process 
	begin
		Cin <='1';
		wait for 100 ns;
		Cin <='0';
		wait for 100 ns;
		Cin <='1';
		wait for 100 ns;
	end process;
END;
