----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2021 10:42:49
-- Design Name: 
-- Module Name: tb_reg8bits - Behavioral
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

-- Uncomment the folowing library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_reg is
--  Port ( );
end tb_reg;

architecture Behavioral of tb_reg is

component reg is
    Generic (n: natural);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           lr : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (n-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;

signal clk : STD_LOGIC;
signal reset : STD_LOGIC;
signal lr : STD_LOGIC;
signal data_in : STD_LOGIC_VECTOR (7 downto 0);
signal output  : STD_LOGIC_VECTOR (7 downto 0);

constant clk_period : time := 20ns;


begin reg8bits : reg
    Generic map (n=>8)
    Port map (  clk=>clk,
                reset => reset,
                lr=>lr,
                data_in=>data_in,
                data_out=>output  );

process begin
    clk <= '1';
    wait for clk_period/2;
    clk <= '0';
    wait for clk_period/2;
end process;


process begin
    wait for clk_period;
    reset <= '1';
    lr <= '0';
    data_in <= "00001001";
    wait for clk_period;
    reset <= '0';
    
    wait for clk_period;
    reset <= '0';
    lr <= '1';
    data_in <= "00000001";
    
    wait for clk_period;
    reset <= '0';
    lr <= '1';
    data_in <= "00000010";
        
    wait for clk_period;
    reset <= '0';
    lr <= '1';
    data_in <= "00000011";
            
    wait for clk_period;
    reset <= '0';
    lr <= '1';
    data_in <= "00000100";
    
    wait for clk_period;
    lr <= '0';
    
    wait for clk_period;
    reset <= '1';
    
    wait for clk_period;
    reset <= '0';
    
    wait for clk_period;
    lr <= '1';
    data_in <= "00100100";
    
    wait for clk_period;
    wait;
end process;

end Behavioral;
