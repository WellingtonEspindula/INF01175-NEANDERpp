----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2021 09:33:57
-- Design Name: 
-- Module Name: tb_pc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_pc is
--  Port ( );
end tb_pc;

architecture Behavioral of tb_pc is

signal clock, reset : STD_LOGIC;
signal carga_pc, inc_pc : STD_LOGIC;
signal data_in, data_out : STD_LOGIC_VECTOR(7 downto 0);

constant clk_period : time := 20ns;


begin

pc_impl : entity work.pc
    Port Map( data_in => data_in,
           carga_pc => carga_pc,
           inc_pc => inc_pc,
           clk => clock,
           reset => reset,
           data_out => data_out);
            
process begin
    clock <= '1';
    wait for clk_period/2;
    clock <= '0';
    wait for clk_period/2;
end process;


process begin
    wait for clk_period;
    carga_pc <= '0';
    reset <= '1';
    
    wait for clk_period; 
    wait for clk_period; 
    reset <= '0';
    inc_pc <= '1';
    data_in <= x"10";
    

    wait for clk_period; 
    wait for clk_period; 
    wait for clk_period; 
    wait for clk_period; 
    
    carga_pc <= '1';
    inc_pc <= '0';
    wait for clk_period;    
    wait for clk_period;    
    carga_pc <= '0';
    inc_pc <= '1';
    
    wait for clk_period;    
    wait for clk_period;
    wait;
end process;



end Behavioral;
