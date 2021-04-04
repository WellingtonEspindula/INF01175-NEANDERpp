----------------------------------------------------------------------------------
-- Company: INF/UFRGS
-- Author: Wellington Espindula 
--
-- Create Date: 26.03.2021 11:45:21
-- Project Name: Neander
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;


entity decod is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           nop_cmd : out STD_LOGIC;
           sta_cmd : out STD_LOGIC;
           lda_cmd : out STD_LOGIC;
           add_cmd : out STD_LOGIC;
           sub_cmd : out STD_LOGIC;
           or_cmd : out STD_LOGIC;
           and_cmd : out STD_LOGIC;
           xor_cmd : out STD_LOGIC;
           not_cmd : out STD_LOGIC;
           jmp_cmd : out STD_LOGIC;
           jn_cmd : out STD_LOGIC;
           jz_cmd : out STD_LOGIC;
           hlt_cmd : out STD_LOGIC);
end decod;

architecture Behavioral of decod is
begin

process(A) begin
    nop_cmd <= '0';
    sta_cmd <= '0';
    lda_cmd <= '0';
    add_cmd <= '0';
    sub_cmd <= '0';
    or_cmd <= '0';
    and_cmd <= '0';
    xor_cmd <= '0';
    not_cmd <= '0';
    jmp_cmd <= '0';
    jn_cmd <= '0';
    jz_cmd <= '0';
    hlt_cmd <= '0';

    case A is
        when "0000" => nop_cmd <= '1'; -- NOP
        when "0001" => sta_cmd <= '1'; -- STA
        when "0010" => lda_cmd <= '1'; -- LDA
        when "0011" => add_cmd <= '1'; -- ADD
        when "0100" => or_cmd <= '1'; -- OR
        when "0101" => and_cmd <= '1'; -- AND
        when "0110" => not_cmd <= '1'; -- NOT
        when "0111" => sub_cmd <= '1'; -- SUB
        when "1000" => jmp_cmd <= '1'; -- JMP
        when "1001" => jn_cmd <= '1'; -- JN
        when "1010" => jz_cmd <= '1'; -- JZ
        when "1011" => xor_cmd <= '1'; -- XOR
        when "1111" => hlt_cmd <= '1'; -- HLT
        when others => null;
     end case;
end process; 

end Behavioral;
