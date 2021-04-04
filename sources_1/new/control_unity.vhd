----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2021 00:17:30
-- Design Name: 
-- Module Name: control_unity - Behavioral
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

entity control_unity is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;

           --input
           N, Z: in STD_LOGIC;
           nop_cmd, sta_cmd, lda_cmd, add_cmd: in STD_LOGIC;
           sub_cmd, or_cmd, and_cmd, xor_cmd, not_cmd : in STD_LOGIC;
           jmp_cmd, jn_cmd, jz_cmd, hlt_cmd: in STD_LOGIC;
           --output
           sel_mux : out STD_LOGIC;
           sel_rdm : out STD_LOGIC;
           inc_pc : out STD_LOGIC;
           load_pc	: out STD_LOGIC;	
           load_rem	: out STD_LOGIC;	
           write_mem : out STD_LOGIC_VECTOR(0 downto 0);	
           load_rdm : out STD_LOGIC;	
           sel_ula : out STD_LOGIC_VECTOR (2 downto 0);
           load_nz : out STD_LOGIC;
           load_ac : out STD_LOGIC;
           load_ri : out STD_LOGIC;
           reset_registers : out STD_LOGIC;
           hlt : out STD_LOGIC);	
end control_unity;

architecture Behavioral of control_unity is

type t_state is (t0, t1, t2, t3, t4, t5, t6, t7);
signal current_state, next_state : t_state;

constant ADD_ULA : STD_LOGIC_VECTOR(2 downto 0) := "000";
constant AND_ULA : STD_LOGIC_VECTOR(2 downto 0) := "001";
constant OR_ULA  : STD_LOGIC_VECTOR(2 downto 0) := "010";
constant NOT_ULA : STD_LOGIC_VECTOR(2 downto 0) := "011";
constant B_ULA   : STD_LOGIC_VECTOR(2 downto 0) := "100";
constant SUB_ULA : STD_LOGIC_VECTOR(2 downto 0) := "110";
constant XOR_ULA : STD_LOGIC_VECTOR(2 downto 0) := "111";


begin

-- FSM
process(N, Z, nop_cmd, sta_cmd, lda_cmd, add_cmd, sub_cmd, or_cmd, and_cmd, xor_cmd, not_cmd, jmp_cmd, jn_cmd, jz_cmd, hlt_cmd) 
begin
    sel_mux <= '0';
    sel_rdm <= '0';
    inc_pc <= '0';
    load_pc	<= '0';
    load_rem <= '0';
    write_mem <= "0";
    load_rdm <= '0';
    sel_ula <= "000";
    load_nz <= '0';
    load_ac <= '0';
    load_ri <= '0';
    reset_registers <= '0';
    hlt <= '0';

    case current_state is
        when t0 => 
            if (hlt_cmd = '0' or start = '1') then
                sel_mux <= '0';
                load_rem <= '1';
                next_state <= t1;
            elsif (hlt_cmd = '1') then
                hlt <= '1';
            end if;
        when t1 =>
            inc_pc <= '1';
            load_rdm <= '1';
            next_state <= t2;
            
        when t2 =>
            load_ri <= '1';
            next_state <= t3;
   
        when t3 =>
            if (not_cmd = '1') then
                sel_ula <= NOT_ULA;
                load_ac <= '1';
                load_nz <= '1';
                next_state <= t0;
            elsif ((jn_cmd = '1' and N = '0') or (jz_cmd = '1' and Z = '0')) then
                inc_pc <= '1';
                next_state <= t0;
            elsif (nop_cmd = '1') then
                next_state <= t0;
            elsif (hlt_cmd = '1') then
                hlt <= '1';
                next_state <= t0;
            else 
                sel_mux <= '0';
                load_rem <= '1';
                next_state <= t4;
            end if;
            
        when t4 =>
            if (sta_cmd = '1' or lda_cmd = '1' or and_cmd = '1' or or_cmd = '1' or xor_cmd = '1'or add_cmd = '1' or sub_cmd = '1') then
                inc_pc <= '1';
                load_rdm <= '1';
            elsif (jmp_cmd = '1' or (jn_cmd = '1' and N = '1') or (jn_cmd = '1' and N = '1')) then
                load_rdm <= '1';
            end if;
            next_state <= t5;
            
        when t5 =>
            if (sta_cmd = '1' or lda_cmd = '1' or and_cmd = '1' or or_cmd = '1' or xor_cmd = '1'or add_cmd = '1' or sub_cmd = '1') then
                sel_mux <= '1';
                load_rem <= '1';
                next_state <= t6;
            elsif (jmp_cmd = '1' or (jn_cmd = '1' and N = '1') or (jz_cmd = '1' and Z = '1')) then
                load_pc <= '1';
                next_state <= t0;
            end if;
        
        when t6 =>
            if (sta_cmd = '1') then
                load_rdm <= '1';
            elsif (lda_cmd = '1' or add_cmd = '1' or sub_cmd = '1' or not_cmd = '1' or and_cmd='1' or or_cmd = '1' or
                    xor_cmd = '1' or jmp_cmd = '1' or jn_cmd = '1' or jz_cmd = '1') then
                load_rdm <= '1';
            end if;
            next_state <= t7;
                     
        when t7 =>
            if (sta_cmd = '1') then
                sel_rdm <= '1';
                write_mem <= "1";
            elsif (lda_cmd = '1') then
                sel_ula <= B_ULA;
                load_ac <= '1';
                load_nz <= '1';
                next_state <= t0;
                
            elsif (and_cmd = '1') then
                sel_ula <= AND_ULA;
                load_ac <= '1';
                load_nz <= '1';
                next_state <= t0;

            elsif (or_cmd = '1') then
                sel_ula <= OR_ULA;
                load_ac <= '1';
                load_nz <= '1';
                next_state <= t0;
                
            elsif (add_cmd = '1') then
                sel_ula <= ADD_ULA;
                load_ac <= '1';
                load_nz <= '1';
                next_state <= t0;            
            
            elsif (sub_cmd = '1') then
                sel_ula <= SUB_ULA;
                load_ac <= '1';
                load_nz <= '1';
                next_state <= t0;
                            
            elsif (xor_cmd = '1') then
                sel_ula <= XOR_ULA;
                load_ac <= '1';
                load_nz <= '1';
                next_state <= t0;
                
            end if;
            next_state <= t0;    
        
        when others => 
            reset_registers <= '1';
            next_state <= t0;      
            
    end case;
end process;

-- State Reg
process(clk, reset) begin
    if reset='1' then 
        current_state <= t0;
    elsif (RISING_EDGE(clk)) then
        current_state <= next_state;
    end if;
end process;

end Behavioral;
