LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY LSFR_tb IS
END LSFR_tb;
 
ARCHITECTURE behavior OF LSFR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LSFR
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LSFR PORT MAP (
          clk => clk,
          rst => rst,
          Q => Q
        );
   --psl default clock is (clk'event and clk = '1');
	--psl property xor_prop is always ({Q(2) xor Q(3)} |=>  {Q(0)} ) async_abort rst='1';
   --psl assert xor_prop;
	--psl property LFSR_prop is always ({Q(0)} |=>  {[*2];Q(3)} ) async_abort rst='1';
   --psl assert LFSR_prop;

process 
begin
clk <='0';
wait for 50 ns;
clk <='1';
wait for 50 ns;
end process;

process 
begin
rst <='0';
wait;
end process;


END;
