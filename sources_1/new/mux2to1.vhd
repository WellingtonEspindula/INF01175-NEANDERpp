----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2021 11:30:22
-- Design Name: 
-- Module Name: mux2to1 - Behavioral
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

entity mux2to1 is
    Generic (n : natural);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (n-1 downto 0));
end mux2to1;

architecture Behavioral of mux2to1 is
begin

output <= A when sel = '0' else
          B when sel = '1' else
          (others => 'X');

end Behavioral;
