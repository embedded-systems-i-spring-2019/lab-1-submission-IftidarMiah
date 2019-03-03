-- Lab 1 Iftidar Miah
-- Test bench for Lab1_part4_counter_top.vhd
-- Uncomment the different sections for each test

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_top_tb is
end counter_top_tb;

architecture counter_top_arch_tb of counter_top_tb is
    signal clk_tb       : std_logic := '0';
    signal btn_tb       : std_logic_vector(3 downto 0) := "0000";
    signal sw_tb        : std_logic_vector(3 downto 0) := "1010";
    signal led_tb       : std_logic_vector(3 downto 0) := "0101";
    
    component counter_top
        port(   clk         : in    std_logic;
                btn, sw     : in    std_logic_vector(3 downto 0);
                led         : out   std_logic_vector(3 downto 0));
    end component;
    
begin

    clk_proc:   process     -- Proc for 125 Mhz (T = 8ns) clock
    begin
        wait for 4ns;
        clk_tb <= '1';
        wait for 4ns;
        clk_tb <= '0';
    end process clk_proc;
    
    -- Clock div pulses for 8 ns then off for 0.5 s and acts as actual
    -- clock when put into clock enable.
    -- Also clock completes one 8ns period during 8ns div pulse
    
    
    
    --------------------------------------------------------------------------
    -- Test 1: Check Reset (BTN(0) debounced into dbnc(0) into RST)
    --------------------------------------------------------------------------
    
--    rst_proc: process   -- Tests reset from button 0 (initial value 0). LED initial value 0101. Enable is button 1.
--    begin
--        wait for 8ns;
--        btn_tb(0) <= '1';
--        wait for 60ns;      -- Clk en off, En off, don't reset led
--        wait for 500ms;     -- Clk en on, En off, don't reset led
--        btn_tb(1) <= '1';
--        wait for 60ns;      -- Clk en off, En on, reset LED
--        btn_tb(0) <= '0';   -- Leave rst off to allow one count
--        wait for 999.99984ms;
--        btn_tb(0) <= '1';
--        wait for 60ns;      -- Clk_en on, En on, reset LED
--    end process rst_proc;

    --------------------------------------------------------------------------
    -- Test 2: Test Load, Dir & UPDN, and over/underflow
    --------------------------------------------------------------------------
    
--    count_proc: process
--    begin
--        wait for 8ns;
--        btn_tb(1) <= '1';   -- En = 1
--        btn_tb(3) <= '1';   -- Ld = 1, default val = sw = 1010
--        wait for 500ms;     -- Ld = 1, clk_en = 1, En = 1, so load 1010 into val_reg
--        btn_tb(3) <= '0';   -- Can turn off for now because holding a button hurts
--        --wait for 5500ms;    -- Check for counting down every 500ms with clk_en rising edge
--        sw_tb(0) <= '1';    -- Dir = sw(0) = 1
--        btn_tb(2) <= '1';   -- UPDN = 1, will debounce soon
--        wait for 500ms;     -- DIR=1, UPDN=1, clk_en=1, En=1, loads dir onto dir_reg and starts counting up
--        sw_tb(0) <= '0';
--        btn_tb(2) <= '0';   -- Turn off dir and updn cause we don't need them anymore
--        wait for 5500ms;
--    end process count_proc;
    
    dut: counter_top
        Port Map(   clk => clk_tb,
                    btn => btn_tb,
                    sw  => sw_tb,
                    led => led_tb
        );
    
    
end counter_top_arch_tb;