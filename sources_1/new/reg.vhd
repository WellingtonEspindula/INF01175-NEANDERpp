library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg is
    generic(n: natural := 8);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           lr : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (n-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (n-1 downto 0));
end reg;

architecture Behavioral of reg is

signal output: STD_LOGIC_VECTOR (n-1 downto 0) := (others => '0');

begin
process(clk, reset, lr, data_in) begin
    if (reset = '1') then
        output <= (others=>'0');
    elsif rising_edge(clk) then
        if (lr='1') then
            output <= data_in;
        end if;
    end if;
end process;

data_out <= output;

end Behavioral;
