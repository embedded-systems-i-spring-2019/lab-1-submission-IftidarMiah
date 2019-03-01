-- Lab 1 Iftidar Miah
-- Test bench for lab1_part1_divider_top.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider_top_tb is
end divider_top_tb;

architecture divider_top_tb_arch of divider_top_tb is
    signal tb_clk   : std_logic := '0';
    signal tb_led0   : std_logic := '0';
    signal tb_div   : std_logic;
    
    component divider_top is
    port(   clk	    : in	std_logic;
            led0    : out    std_logic); 
    end component;
    
    component clock_div is
    port(   clk     : in    std_logic;
            div     : out   std_logic);
    end component;
        
begin
    clk_proc: process   -- simulate 125MHz clk (8ns period)
    begin
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        tb_clk <= '0';
    end process clk_proc;
    
    dut1: divider_top
    port map(
        clk => tb_clk,
        led0 => tb_led0
    );
    
    dut2: clock_div
    port map(
        clk => tb_clk,
        div => tb_div
    );
    
end divider_top_tb_arch;
