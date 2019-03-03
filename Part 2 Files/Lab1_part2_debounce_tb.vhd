-- Lab 1 Iftidar Miah
-- Test bench for Lab1_part2_debounce.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity debounce_tb is
end debounce_tb;

architecture debounce_arch_tb of debounce_tb is
    signal clk_tb, btn0_tb      :   std_logic := '0';
    signal dbnc_tb              :   std_logic; 
    
    component debounce is
        port(   clk, btn0    : in    std_logic;
                dbnc        :  out   std_logic);
    end component;
begin

    clk_proc: process
    begin
        wait for 4ns;
        clk_tb <= '1';
        wait for 4ns;
        clk_tb <= '0';
    end process clk_proc;
    
    btn0_proc: process
    begin
        wait for 50 ms;
        btn0_tb <= '1';
        wait for 50 ms;
        btn0_tb <= '0';
    end process btn0_proc;

    dut: debounce
    port map(   clk     => clk_tb,
                btn0    => btn0_tb,
                dbnc    => dbnc_tb
            );
    
end debounce_arch_tb;