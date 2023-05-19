LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY shift_lift_nested_for_if_tb IS
END shift_lift_nested_for_if_tb;
 
ARCHITECTURE behavior OF shift_lift_nested_for_if_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_lift_nested_for_if
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         Input_Data : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal Input_Data : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_lift_nested_for_if 
   PORT MAP (
			clk => clk,
			rst => rst,
			Input_Data => Input_Data,
			Q => Q
			);
			
   --psl default clock is (clk'event and clk = '1');
	--psl property shift_prop is always ({not rst} |->  {Q=prev(Q(2 downto 0)&Input_Data)}) async_abort rst='1';
   --psl assert shift_prop;
   --psl property rst_prop is always ( {rst = '1'} |=> { Q="0000"} until (not rst) );
   --psl assert rst_prop;

	process 
	begin
		clk <='1';
		wait for 50 ns;
		clk <='0';
		wait for 50 ns;
	end process;
	
	process 
	begin
		rst <='1';
		wait for 100 ns;
		rst <='0';
		wait for 500 ns;
		rst <='1';
		wait for 100 ns;
		rst <='0';
		wait ;
	end process;
	
	
	process 
	begin
		Input_Data <='0';
		wait for 150 ns;
		Input_Data <='1';
		wait for 100 ns;
		Input_Data <='0';
		wait for 100 ns;
		Input_Data <='1';
		wait for 100 ns;
	end process;
END;
