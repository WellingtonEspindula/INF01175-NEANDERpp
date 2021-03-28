----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2021 13:19:14
-- Design Name: 
-- Module Name: regNZ - Behavioral
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

entity regNZ is
    Generic (n : natural := 8);
    Port ( A : in STD_LOGIC_VECTOR(n-1 downto 0);
           cargaNZ : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_n : out STD_LOGIC;
           out_z : out STD_LOGIC);
end regNZ;

architecture Behavioral of regNZ is

constant zero_cte : STD_LOGIC_VECTOR (n-1 downto 0) := (others => '0');
signal negative, zero : STD_LOGIC;
signal vector_in_NZ : STD_LOGIC_VECTOR(1 downto 0);
signal vector_out_NZ : STD_LOGIC_VECTOR(1 downto 0);

begin

process(A) begin
    negative <= '0';
    zero <= '0';

    if (A = zero_cte) then
        zero <= '1';
    end if;
    
    if (A(n-1) = '1') then
        negative <= '1';
    end if;
    
    vector_in_NZ <= negative & zero;
end process;


reg2bits : entity work.reg 
    generic map ( n=> 2)
    Port map ( clk => clk,
           reset => reset,
           lr => cargaNZ,
           data_in => vector_in_NZ,
           data_out => vector_out_NZ);

out_n <= vector_out_NZ(1);
out_z <= vector_out_NZ(0);

end Behavioral;
