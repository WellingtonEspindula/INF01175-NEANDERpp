----------------------------------------------------------------------------------
-- Company: INF/UFRGS
-- Engineering Student: Wellington Espindula 
-- 
-- Create Date: 18.03.2021 19:57:23
-- Design Name: 
-- Module Name: ula - Behavioral
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

entity ula is
    Generic ( width: natural := 8); 
    Port ( A : in STD_LOGIC_VECTOR (width-1 downto 0);
           B : in STD_LOGIC_VECTOR (width-1 downto 0);
           operation : in STD_LOGIC_VECTOR (2 downto 0);
           result : out STD_LOGIC_VECTOR (width-1 downto 0);
           overflow : out STD_LOGIC);
end ula;


architecture Behavioral of ula is

signal operation_result: STD_LOGIC_VECTOR(width downto 0) := (others => '0');

begin

-- 000 ADD
-- 001 AND
-- 010 OR
-- 011 NOT
-- 100 B
-- 101 A
-- 110 SUB
-- 111 XOR

process(A, B, operation) begin
case operation is
    when "000" => operation_result <= 
        STD_LOGIC_VECTOR(SIGNED('0' & A) + SIGNED('0' & B));
    when "001" => operation_result <= '0' & (A AND B);
    when "010" => operation_result <= '0' & (A OR B);
    when "011" => operation_result <= '0' & NOT(A);
    when "100" => operation_result <= '0' & B;
    when "101" => operation_result <= '0' & A;
    when "110" => operation_result <= 
        STD_LOGIC_VECTOR(SIGNED('0' & A) - SIGNED('0' & B));
    when "111" => operation_result <= '0' & (A XOR B);
    when others => operation_result <= (others => 'X');
end case;
end process;

result <= operation_result(width-1 downto 0);
overflow <= operation_result(width);

end Behavioral;
