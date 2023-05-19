LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
ENTITY case_gen_tb IS
END case_gen_tb;
 
ARCHITECTURE behavior OF case_gen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT case_gen
    PORT(
				A:  in STD_LOGIC_VECTOR (3 downto 0);
				B:	 in STD_LOGIC_VECTOR (3 downto 0);
				C:  out STD_LOGIC_VECTOR (3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : STD_LOGIC_VECTOR (3 downto 0) := "0000";
   signal B : STD_LOGIC_VECTOR (3 downto 0) := "0000";

 	--Outputs
   signal C : std_logic_vector(3 downto 0);

 
   signal clk : std_logic:= '0';
 

 
BEGIN 

 
	-- Instantiate the Unit Under Test (UUT)
   uut: case_gen 
   PORT MAP (
			A => A,
			B => B,
			C => C
			);
			
   --psl default clock is (clk'event and clk = '1');
   --psl property case_gen_prop is always ({C=(A and B)});
   --psl assert case_gen_prop;
   --    report "failed conditioin";

	clk <= not clk after 50 ns ;

	process 
	begin
		A <="0101";
		wait for 100 ns;
		A <="1011";
		wait for 100 ns;
		A <="1111";
		wait for 100 ns;
		A <="0000";
		wait for 100 ns;
	end process;

	process 
	begin
		B <="0011";
		wait for 100 ns;
		B <="0110";
		wait for 100 ns;
		B <="0001";
		wait for 100 ns;
		B <="1111";
		wait for 100 ns;
	end process;

END;
