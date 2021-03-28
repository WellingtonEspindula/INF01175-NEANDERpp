----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2021 09:58:02
-- Design Name: 
-- Module Name: tb_regNZ - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

entity tb_regNZ is
--  Port ( );
end tb_regNZ;

architecture Behavioral of tb_regNZ is

signal data : STD_LOGIC_VECTOR(7 downto 0);
signal cargaNZ, out_n, out_z: STD_LOGIC;
signal clock, reset: STD_LOGIC;

constant clk_period : time := 20ns;

begin

regNZ : entity work.regNZ 
     Port Map ( A => data,
           cargaNZ => cargaNZ,
           clk => clock,
           reset => reset,
           out_n => out_n,
           out_z => out_z);
           
       
process begin
    clock <= '1';
    wait for clk_period/2;
    clock <= '0';
    wait for clk_period/2;
end process;


process begin
    wait for clk_period;
    cargaNZ <= '0';
    reset <= '1';
    
    wait for clk_period; 
    wait for clk_period; 
    reset <= '0';
    cargaNZ <= '1';
    data <= x"10";
    
    wait for clk_period; 
    wait for clk_period; 
    
    data <= x"F0";
    
    wait for clk_period;    
    data <= x"00";
    cargaNZ <= '0';
      
    wait for clk_period;
    wait for clk_period;
    cargaNZ <= '1';

    wait;
end process;



end Behavioral;
