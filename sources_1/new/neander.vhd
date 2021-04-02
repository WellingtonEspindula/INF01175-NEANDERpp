----------------------------------------------------------------------------------
-- Company: INF/UFRGS
-- Author: Wellington Espindula 
-- 
-- Create Date: 19.03.2021 09:55:12
-- Project Name: Neander
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity neander is
    Port (  clk : in STD_LOGIC;
            reset_ext : in STD_LOGIC;
            
            dng_N           : out STD_LOGIC;
            dbg_Z           : out STD_LOGIC;
            dbg_sel_mux     : out STD_LOGIC;
            dbg_inc_pc      : out  STD_LOGIC;
            dbg_load_pc     : out STD_LOGIC;
            dbg_load_rem    : out STD_LOGIC;
            dbg_write_mem   : out STD_LOGIC;
            dbg_load_rdm    : out STD_LOGIC;
            dbg_sel_ula     : out STD_LOGIC_VECTOR(2 downto 0);
            dbg_load_nz     : out STD_LOGIC;
            dbg_load_ac     : out STD_LOGIC;
            dbg_load_ri     : out STD_LOGIC;
            dbg_reset_int   : out STD_LOGIC;
            dbg_hlt         : out STD_LOGIC;
            
            dbg_out_pc : out STD_LOGIC_VECTOR (7 downto 0);
            dbg_out_mux :out  STD_LOGIC_VECTOR(7 downto 0);
            dbg_out_rem :out  STD_LOGIC_VECTOR(7 downto 0);
            dbg_in_rdm : out STD_LOGIC_VECTOR(7 downto 0); 
            dbg_sel_rdm :out  STD_LOGIC;                   
            dbg_out_rdm :out  STD_LOGIC_VECTOR(7 downto 0);
            dbg_out_mem :out  STD_LOGIC_VECTOR(7 downto 0);
            dbg_opcode : out STD_LOGIC_VECTOR(3 downto 0); 
            dbg_out_ri : out STD_LOGIC_VECTOR(7 downto 0); 
            dbg_out_ac : out STD_LOGIC_VECTOR(7 downto 0); 
            dbg_out_ula :out  STD_LOGIC_VECTOR(7 downto 0);
            
            dbg_mem : out STD_LOGIC_VECTOR(63 downto 0));
end neander;

architecture Behavioral of neander is

signal reset : STD_LOGIC;

-- control unity signals
-- input signals
signal N, Z : STD_LOGIC;
signal nop_cmd, sta_cmd, lda_cmd, add_cmd: STD_LOGIC;
signal sub_cmd, or_cmd, and_cmd, xor_cmd, not_cmd : STD_LOGIC;
signal jmp_cmd, jn_cmd, jz_cmd, hlt_cmd: STD_LOGIC;

--output signals
signal sel_mux : STD_LOGIC;
signal inc_pc : STD_LOGIC;
signal load_pc : STD_LOGIC;
signal load_rem : STD_LOGIC;
signal write_mem : STD_LOGIC;
signal load_rdm : STD_LOGIC;
--signal read_mem : STD_LOGIC;
signal sel_ula : STD_LOGIC_VECTOR(2 downto 0);
signal load_nz : STD_LOGIC;
signal load_ac : STD_LOGIC;
signal load_ri : STD_LOGIC;
signal reset_int : STD_LOGIC;
signal hlt : STD_LOGIC;

-- components inputs and outputs signals
signal out_pc : STD_LOGIC_VECTOR (7 downto 0);
signal out_mux : STD_LOGIC_VECTOR(7 downto 0);
signal out_rem : STD_LOGIC_VECTOR(7 downto 0);
signal in_rdm : STD_LOGIC_VECTOR(7 downto 0);
signal sel_rdm : STD_LOGIC;
signal out_rdm : STD_LOGIC_VECTOR(7 downto 0);
signal out_mem : STD_LOGIC_VECTOR(7 downto 0);
signal opcode : STD_LOGIC_VECTOR(3 downto 0);
signal out_ri : STD_LOGIC_VECTOR(7 downto 0);
signal out_ac : STD_LOGIC_VECTOR(7 downto 0);
signal out_ula : STD_LOGIC_VECTOR(7 downto 0);
signal overflow_ula : STD_LOGIC;

begin

-- debugging
            
dng_N           <=  N;
dbg_Z           <=  Z;
dbg_sel_mux     <=  sel_mux    ;
dbg_inc_pc      <=  inc_pc     ;
dbg_load_pc     <=  load_pc    ;
dbg_load_rem    <=  load_rem   ;
dbg_write_mem   <=  write_mem  ;
dbg_load_rdm    <=  load_rdm   ;
dbg_sel_ula     <=  sel_ula    ;
dbg_load_nz     <=  load_nz    ;
dbg_load_ac     <=  load_ac    ;
dbg_load_ri     <=  load_ri    ;
dbg_reset_int   <=  reset_int  ;
dbg_hlt         <=  hlt        ;

dbg_out_pc   <= out_pc;
dbg_out_mux  <= out_mux;
dbg_out_rem  <= out_rem;
dbg_in_rdm   <= in_rdm ;
dbg_sel_rdm  <= sel_rdm;
dbg_out_rdm  <= out_rdm;
dbg_out_mem  <= out_mem;
dbg_opcode   <= opcode ;
dbg_out_ri   <= out_ri ;
dbg_out_ac   <= out_ac ;
dbg_out_ula  <= out_ula;

reset <= reset_ext or reset_int;

pc_impl : entity work.PC
    Generic Map (n => 8)
    Port Map (clk => clk, reset => reset, data_in=>out_rdm, inc_pc => inc_pc, carga_pc => load_pc, data_out => out_pc);

mux : entity work.mux2to1
    Generic Map (n => 8)
    Port Map (A => out_pc, B => out_rdm, sel => sel_mux, output => out_mux);
    
rem_impl : entity work.reg
    Generic Map (n => 8)
    Port Map (clk => clk, reset => reset, lr => load_rem, data_in => out_mux, data_out => out_rem);

-- memory
memory : entity work.mem_reg
    Port Map ( clk => clk,  
           reset => reset, 
           addr => out_rem(2 downto 0),
           data_in => out_rdm, 
           write => write_mem,
           data_out => out_mem,
           dbg_mem => dbg_mem);

in_rdm <= out_mem when sel_rdm = '0' else out_ac when sel_rdm = '1' else out_mem;

rdm_impl : entity work.reg
    Generic Map (n => 8)
    Port Map (clk => clk, reset => reset, lr => load_rdm, data_in => in_rdm, data_out => out_rdm);

ri_impl : entity work.reg
    Generic Map (n => 8)
    Port Map (clk => clk, reset => reset, lr => load_ri, data_in => out_rdm, data_out => out_ri); 

opcode <= out_ri(7 downto 4);

decod_impl : entity work.decod 
    Port Map (A => opcode, nop_cmd => nop_cmd, sta_cmd => sta_cmd, lda_cmd => lda_cmd, 
    add_cmd => add_cmd, sub_cmd => sub_cmd, or_cmd => or_cmd, and_cmd => and_cmd,
    xor_cmd => xor_cmd, not_cmd => not_cmd, jmp_cmd => jmp_cmd, jn_cmd => jn_cmd,
    jz_cmd => jz_cmd, hlt_cmd => hlt_cmd);
    
ula : entity work.ula 
    Generic Map (width => 8)
    Port Map (A => out_ac, B => out_rdm, operation => sel_ula, result => out_ula, overflow => overflow_ula);

ac: entity work.reg
    Generic Map (n => 8)
    Port Map (clk => clk, reset => reset, lr => load_ac, data_in => out_ula, data_out => out_ac);

regNZ_impl : entity work.regNZ
    Generic Map (n => 8)
    Port Map ( A => out_ula, cargaNZ => load_nz, clk => clk, reset => reset, out_n => N,
                out_z => Z);

uc : entity work.control_unity
    Port Map ( clk => clk,
           reset => reset_int,
           --input
           N => N, Z => Z,
           nop_cmd => nop_cmd, sta_cmd => sta_cmd, lda_cmd => lda_cmd, add_cmd => add_cmd,
           sub_cmd => sub_cmd, or_cmd => or_cmd, and_cmd => and_cmd, xor_cmd => xor_cmd, not_cmd  => not_cmd,
           jmp_cmd => jmp_cmd, jn_cmd => jn_cmd, jz_cmd => jz_cmd, hlt_cmd => hlt_cmd,
           --output
           sel_mux => sel_mux,
           sel_rdm => sel_rdm,
           inc_pc => inc_pc,
           load_pc => load_pc,	
           load_rem => load_rem,	
           write_mem => write_mem,	
           load_rdm => load_rdm,	
           sel_ula => sel_ula,
           load_nz => load_nz ,
           load_ac => load_ac,
           load_ri => load_ri,
           reset_registers  => reset_int,
           hlt => hlt);
-- debug outputs
end Behavioral;
