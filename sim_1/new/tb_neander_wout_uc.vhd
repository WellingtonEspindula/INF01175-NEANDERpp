----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2021 10:14:31
-- Design Name: 
-- Module Name: tb_neander_wout_uc - Behavioral
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

entity tb_neander_wout_uc is
--  Port ( );
end tb_neander_wout_uc;

architecture Behavioral of tb_neander_wout_uc is

constant clk_period : time := 20ns;

signal clock, reset: STD_LOGIC;
--output signals
signal N, Z : STD_LOGIC;
signal sel_mux : STD_LOGIC;
signal inc_pc : STD_LOGIC;
signal load_pc : STD_LOGIC;
signal load_rem : STD_LOGIC;
signal write_mem : STD_LOGIC;
signal load_rdm : STD_LOGIC;
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

signal dbg_mem : STD_LOGIC_VECTOR (63 downto 0);

begin

neander_debug : entity work.neander
     Port Map (  clk => clock,
            reset_ext => reset,
                     
            dng_N         => N,
            dbg_Z         => Z,
            dbg_sel_mux   => sel_mux  ,
            dbg_inc_pc    => inc_pc   ,
            dbg_load_pc   => load_pc  ,
            dbg_load_rem  => load_rem ,
            dbg_write_mem => write_mem,
            dbg_load_rdm  => load_rdm ,
            dbg_sel_ula   => sel_ula  ,
            dbg_load_nz   => load_nz  ,
            dbg_load_ac   => load_ac  ,
            dbg_load_ri   => load_ri  ,
            dbg_reset_int => reset_int,
            dbg_hlt       => hlt      ,
            
            dbg_out_pc    => out_pc ,
            dbg_out_mux   => out_mux,
            dbg_out_rem   => out_rem,
            dbg_in_rdm    => in_rdm , 
            dbg_sel_rdm   => sel_rdm, 
            dbg_out_rdm   => out_rdm,
            dbg_out_mem   => out_mem,
            dbg_opcode    => opcode , 
            dbg_out_ri    => out_ri , 
            dbg_out_ac    => out_ac , 
            dbg_out_ula   => out_ula,
            
            dbg_mem => dbg_mem);

          
process begin
    clock <= '1';
    wait for clk_period/2;
    clock <= '0';
    wait for clk_period/2;
end process;


process begin
--    wait for clk_period;
--    sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';
    
--    -- NOP
--    -- t0
--    wait for clk_period; 
--    sel_mux <= '0';
--    load_rem <= '1';

--    -- sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    -- load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';

    
--    -- t1
--    wait for clk_period;    
--    inc_pc <= '1';
--    load_rdm <= '1';
    
--    sel_mux <= '0';
--    -- inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    -- load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';
    
--    -- t2
--    wait for clk_period;  
--    load_ri <= '1';

--    sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    -- load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';

--    -- LDA
--    -- t0
--    wait for clk_period; 
--    sel_mux <= '0';
--    load_rem <= '1';

--    -- sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    -- load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';

    
--    -- t1
--    wait for clk_period;    
--    inc_pc <= '1';
--    load_rdm <= '1';

--    sel_mux <= '0';
--    -- inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    -- load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';

    
--    -- t2
--    wait for clk_period;  
--    load_ri <= '1';

--    sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    -- load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';
    
        
--    -- t3
--    wait for clk_period;    
--    sel_mux <= '0';
--    load_rem <= '1';

--    -- sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    -- load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';
        
--    -- t4
--    wait for clk_period;    
--    inc_pc <= '1';
--    load_rdm <= '1';

--    sel_mux <= '0';
--    -- inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    -- load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';
            
--    -- t5
--    wait for clk_period;    
--    sel_mux <= '1';
--    load_rem <= '1';    
    
--    -- sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    -- load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';
            
   
--    -- t6
--    wait for clk_period;    
--    load_rdm <= '1';

--    sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    -- load_rdm <= '0';
--    sel_ula <= "000";
--    load_nz <= '0';
--    load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';

--    -- t7
--    wait for clk_period;
--    sel_ula <= "100";
--    load_ac <= '1';
--    load_nz <= '1';  
    
--    sel_mux <= '0';
--    inc_pc <= '0';
--    load_pc	<= '0';
--    load_rem <= '0';
--    write_mem <= '0';
--    load_rdm <= '0';
--    -- sel_ula <= "000";
--    -- load_nz <= '0';
--    -- load_ac <= '0';
--    load_ri <= '0';
--    reset_int <= '0';
--    hlt <= '0';

    wait;
end process;




end Behavioral;
