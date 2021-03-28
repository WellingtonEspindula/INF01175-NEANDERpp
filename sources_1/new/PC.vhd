----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2021 13:12:14
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Generic (n : natural := 8);
    Port ( data_in : in STD_LOGIC_VECTOR (n-1 downto 0);
           carga_pc : in STD_LOGIC;
           inc_pc : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (n-1 downto 0));
end PC;

architecture Behavioral of PC is

constant init_const : std_logic_vector(7 downto 0) := (others => '0');
signal count : std_logic_vector(n-1 downto 0) := init_const;

begin

process(clk, reset) begin
if (reset='1') then
   count <= init_const; 
elsif rising_edge(clk) then
    if carga_pc = '1' then
        count <= data_in;
    elsif inc_pc = '1' then
        count <= std_logic_vector(unsigned(count)+1);
    else 
        count <= count;
    end if;
end if; 
end process;

data_out <= count;

end Behavioral;
