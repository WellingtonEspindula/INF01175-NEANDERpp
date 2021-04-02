----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2021 22:22:41
-- Design Name: 
-- Module Name: mem_reg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_reg is
    Generic ( width : natural := 8);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (2 downto 0);
           data_in : in STD_LOGIC_VECTOR (width-1 downto 0);
           write : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (width-1 downto 0);
           dbg_mem : out STD_LOGIC_VECTOR ((8*width)-1 downto 0)
           );
end mem_reg;

architecture Behavioral of mem_reg is

signal mem1_wr, mem2_wr, mem3_wr, mem4_wr : STD_LOGIC;
signal instr1, instr2, instr3, instr4, instr5: STD_LOGIC_VECTOR (width-1 downto 0);
signal mem1_out, mem2_out, mem3_out, mem4_out : STD_LOGIC_VECTOR (width-1 downto 0);

begin

-- hardcoded instructions
instr1 <= x"20";
instr2 <= x"03";
instr3 <= x"90";
instr4 <= x"00";
instr5 <= x"F4";

-- hardcoded instructions
-- instr1 <= x"00";
-- instr2 <= x"20";
-- instr3 <= x"03";
-- instr4 <= x"0F";

-- mem1_wr <= '1' when (write = '1' and addr = "100") else '0'; 
mem2_wr <= '1' when (write = '1' and addr = "101") else '0'; 
mem3_wr <= '1' when (write = '1' and addr = "110") else '0'; 
mem4_wr <= '1' when (write = '1' and addr = "111") else '0'; 

-- memory1 : entity work.reg
--     Generic Map (n => width)
--     Port Map ( clk => clk,
--            reset => reset,
--            lr => mem1_wr,
--            data_in => data_in,
--            data_out => mem1_out);

memory2 : entity work.reg
    Generic Map (n => width)
    Port Map ( clk => clk,
           reset => reset,
           lr => mem2_wr,
           data_in => data_in,
           data_out => mem2_out);

memory3 : entity work.reg
    Generic Map (n => width)
    Port Map ( clk => clk,
           reset => reset,
           lr => mem3_wr,
           data_in => data_in,
           data_out => mem3_out);

memory4 : entity work.reg
    Generic Map (n => width)
    Port Map ( clk => clk,
           reset => reset,
           lr => mem4_wr,
           data_in => data_in,
           data_out => mem4_out);
           
data_out <= instr1 when addr = "000" else 
            instr2 when addr = "001" else 
            instr3 when addr = "010" else 
            instr4 when addr = "011" else 
            instr5 when addr = "100" else 
            -- mem1_out when addr = "100" else 
            mem2_out when addr = "101" else 
            mem3_out when addr = "110" else 
            mem4_out when addr = "111" else 
            (others => 'X');

-- dbg_mem <= mem4_out & mem3_out & mem2_out & mem1_out; 
-- dbg_mem <= mem4_out & mem3_out & mem2_out & instr5 & instr4 & instr3 & instr2 & instr1; 
dbg_mem <= instr1 & instr2 & instr3 & instr4 & instr5 & mem2_out & mem3_out & mem4_out; 

end Behavioral;
