-- Lab 1 Iftidar Miah
-- Test bench for lab1_clock_div.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_div_tb is
end clock_div_tb;

architecture clock_div_tb_arch of clock_div_tb is
    signal tb_clk   : std_logic := '0';
    signal tb_div   : std_logic := '0';
    
    component clock_div is
    port(   clk	    : in	std_logic;
            div     : out    std_logic); 
    end component;
        
begin
    clk_proc: process   -- simulate 125MHz clk (8ns period)
    begin
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        tb_clk <= '0';
    end process clk_proc;
    
    dut: clock_div
    port map(
        clk => tb_clk,
        div => tb_div
    );
    
end clock_div_tb_arch;

