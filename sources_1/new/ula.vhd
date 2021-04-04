----------------------------------------------------------------------------------
-- Company: INF/UFRGS
-- Engineering Student: Wellington Espindula 
-- 
-- Create Date: 18.03.2021 19:57:23
-- Project Name: Neander
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

begin

-- 000 ADD
-- 001 AND
-- 010 OR
-- 011 NOT
-- 100 B
-- 110 SUB
-- 111 XOR

process(A, B, operation) begin
case operation is
    when "000" => result <= STD_LOGIC_VECTOR(SIGNED(A) + SIGNED(B));
    when "001" => result <= (A AND B);
    when "010" => result <= (A OR B);
    when "011" => result <= NOT(A);
    when "100" => result <= B;
    -- when "101" => result <= A;
    when "110" => result <= STD_LOGIC_VECTOR(SIGNED(A) - SIGNED(B));
    when "111" => result <= (A XOR B);
    when others => result <= (others => 'X');
end case;
end process;

-- not implemented
overflow <= '0';

end Behavioral;
