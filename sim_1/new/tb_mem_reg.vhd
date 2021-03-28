library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mem_reg is
--  Port ( );
end tb_mem_reg;

architecture Behavioral of tb_mem_reg is

constant clk_period : time := 20ns;
signal clock, reset: STD_LOGIC;
signal addr : STD_LOGIC_VECTOR (2 downto 0);
signal input : STD_LOGIC_VECTOR (7 downto 0);
signal write : STD_LOGIC;
signal data_out : STD_LOGIC_VECTOR (7 downto 0);

signal dbg_mem : STD_LOGIC_VECTOR (31 downto 0);

begin

memory : entity work.mem_reg 
    Port Map ( clk => clock,
           reset => reset,
           addr => addr,
           data_in => input,
           write => write,
           data_out => data_out,
           dbg_mem => dbg_mem);
           
process begin
    clock <= '1';
    wait for clk_period/2;
    clock <= '0';
    wait for clk_period/2;
end process;


process begin
    wait for clk_period;
    reset <= '0';
    input <= "00000001";
    addr <= "100";
    write <= '1';
    
    wait for clk_period; 
    input <= "00000010";   
    addr <= "101";
    write <= '1';
       
    wait for clk_period;    
    input <= "00000011";
    addr <= "110";
    write <= '1';
    
    wait for clk_period;    
    input <= "00000100";
    addr <= "111";
    write <= '1';
    
    for i in 0 to 7 loop
        wait for clk_period;
        addr <= STD_LOGIC_VECTOR(to_unsigned(i, 3));
        write <= '0';
    end loop;
    wait;
end process;

end Behavioral;
