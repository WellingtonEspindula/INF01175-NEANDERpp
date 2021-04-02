----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2021 20:57:02
-- Design Name: 
-- Module Name: tb_ula - Behavioral
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

entity tb_ula is
--  Port ( );
end tb_ula;

architecture Behavioral of tb_ula is

signal A, B, result : STD_LOGIC_VECTOR (7 downto 0);
signal op : STD_LOGIC_VECTOR (2 downto 0);
signal carry : STD_LOGIC;

constant clk_period : time := 20ns;

begin

lula : entity work.ula 
    PORT MAP (A=>A, B=>B, operation=>op, result=>result, overflow=>carry);


-- 000 ADD
-- 001 AND
-- 010 OR
-- 011 NOT
-- 100 B
-- 101 A
-- 110 SUB
-- 111 XOR
process begin
    wait for clk_period;
    A <= "00000000";
    op <= "011";       -- not
    
    wait for clk_period;
    A <= "00000000";
    B <= "00010000";
    op <= "010";         -- or 
    
    wait for clk_period;
    A <= "11111111";
    B <= "00010000";
    op <= "001";         -- AND
    
    wait for clk_period;
    A <= "11111111";
    B <= "00010000";
    op <= "000";         -- ADD 
    
    wait for clk_period;
    A <= "00000001";
    B <= "00010000";
    op <= "000";         -- ADD 
    
    wait for clk_period;
    A <= "11111111";
    B <= "10010000";
    op <= "000";         -- ADD
    
    wait for clk_period;
    A <= "10000000";
    B <= "10000000";
    op <= "000";         -- ADD     
    
    wait for clk_period;
    A <= "10000000";
    B <= "10000000";
    op <= "XXX";         -- ADD 
        
    wait for clk_period;
    A <= "11111111";
    B <= "10000000";
    op <= "110";         -- SUB         
    
    wait for clk_period;
    A <= "11111111";
    B <= "00000001";
    op <= "110";         -- SUB 
        
    wait for clk_period;
    A <= x"04";
    B <= x"f0";
    op <= "110";         -- SUB 
      
    wait for clk_period;
    A <= "00000000";
    B <= "11111111";
    op <= "100";         -- B    
       
    wait for clk_period;
    A <= "00000000";
    B <= "11111111";
    op <= "101";         -- A
    
        
    wait for clk_period;
    A <= "11111111";
    B <= "00000001";
    op <= "111";         -- XOR 
      
    
    wait;
end process;
end Behavioral;
