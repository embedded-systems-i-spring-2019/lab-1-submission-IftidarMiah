-- Lab 1 Iftidar Miah
-- Test bench for Lab1_part3_fancy_counter.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fancy_counter_tb is
end fancy_counter_tb;

architecture fancy_counter_arch_tb of fancy_counter_tb is
    signal clk_tb, clk_en_tb, en_tb, rst_tb, dir_tb, updn_tb, ld_tb :   std_logic := '0';
    signal val_tb  :    std_logic_vector(3 downto 0)    := "1010";
    signal cnt_tb  :    std_logic_vector(3 downto 0)    := "0000";   
    
    component fancy_counter
            port(   clk, clk_en, en, rst, dir, updn, ld : in    std_logic;
                    val                                 : in    std_logic_vector(3 downto 0);
                    cnt                                 : out   std_logic_vector(3 downto 0));
    end component;
begin
    
    clk_proc: process   -- Generate 125 MHz clock
    begin
        wait for 4ns;
        clk_tb <= '1';
        wait for 4ns;
        clk_tb <= '0';
    end process clk_proc;
    
    ------- Multiple Test bench sections for different tests ------------
    ------- Uncomment sections to test different responses   ------------
    
    ----------------------------------------------------------------------------
    -- Test 1: Enable = 0, nothing should change                                            
    -- Made default value of counter into 0101 to make sure reset works
    -- val_reg, dir_reg, and count should stay the same
    ----------------------------------------------------------------------------
    
--    clk_en_proc: process    -- Process for clock enable
--    begin
--        wait for 32ns;
--        clk_en_tb <= '1';
--        wait for 32ns;
--        clk_en_tb <= '0';
--    end process clk_en_proc;
    
--    rst_proc: process   -- Process for reset, affects counter and cnt
--    begin
--        wait for 16ns;
--        rst_tb <= '1';
--        wait for 16ns;
--        rst_tb <= '0';
--    end process rst_proc; 
    
--    updn_proc: process  --Process for dupdn, affects when dir changes dir_reg
--    begin
--        wait for 64ns;
--        updn_tb <= '1';
--        wait for 64ns;
--        updn_tb <= '0';
--    end process updn_proc;
    
--    dir_proc: process   -- Process for dir, affects dir_reg and direction of counting
--    begin
--        wait for 32ns;
--        dir_tb <= '1';
--        wait for 32ns;
--        dir_tb <= '0';
--    end process dir_proc;
    
--    ld_proc: process    -- Process for ld and val, affects val_reg
--    begin
--        wait for 16ns;
--        ld_tb <= '1';
--        wait for 16ns;
--        ld_tb <= '0';
--    end process ld_proc;
    
    
    ----------------------------------------------------------------------------
    -- Test 2: clk_en = 0, only change will occur when En = 1 and rst = 1, cnt resets
    -- Made default value of counter into 0101 to make sure reset works
    -- val_reg, dir_reg, and count should stay the same
    ----------------------------------------------------------------------------

--    en_proc: process    -- Switches enable
--    begin
--        wait for 32ns;
--        en_tb <= '1';
--        wait for 32ns;
--        en_tb <= '0';
--    end process en_proc;
    
--    rst_proc: process   -- Process for reset
--    begin
--        wait for 16ns;
--        rst_tb <= '1';
--        wait for 16ns;
--        rst_tb <= '0';
--    end process rst_proc; 
    
--    updn_proc: process  --Process for updn, affects when dir changes dir_reg
--    begin
--        wait for 64ns;
--        updn_tb <= '1';
--        wait for 64ns;
--        updn_tb <= '0';
--    end process updn_proc;
    
--    dir_proc: process   -- Process for dir, affects dir_reg and direction of counting
--    begin
--        wait for 32ns;
--        dir_tb <= '1';
--        wait for 32ns;
--        dir_tb <= '0';
--    end process dir_proc;
    
--    ld_proc: process    -- Process for ld and val, affects val_reg
--    begin
--        wait for 16ns;
--        ld_tb <= '1';
--        wait for 16ns;
--        ld_tb <= '0';
--    end process ld_proc;
    
    
    ----------------------------------------------------------------------------
    -- Test 3: clk_en = 1, en = 1, rst = 0, updn = 0 -> 1, dir = 0 -> 1, ld = 0 
    -- val_reg stays at initial value of 1111
    -- dir_reg is 0 for half, 1 for other half of runtime
    -- Count will first decrement, then increment after dir_reg becomes 1
    -- Should underflow to 1111 and overflow to 0000
    ----------------------------------------------------------------------------

--        en_tb <= '1';
--        clk_en_tb <= '1';
 
--        updn_proc: process  --Process for updn, affects when dir changes dir_reg
--        begin
--            wait for 264ns;
--            updn_tb <= '1';
--            wait for 256ns;
--            updn_tb <= '0';
--            wait for 248ns;
--            updn_tb <= '1';
--            wait for 256ns;
--            updn_tb <= '0';
--        end process updn_proc;
        
--        dir_proc: process   -- Process for dir, affects dir_reg and direction of counting
--        begin
--            wait for 256ns;
--            dir_tb <= '1';
--            wait for 256ns;
--            dir_tb <= '0';
--        end process dir_proc;
        
    
----------------------------------------------------------------------------
    -- Test 4: clk_en = 1, en = 1, rst = 0, updn = 0 -> 1, dir = 0 -> 1, ld = 1 
    -- val_reg goes from initial value of 1111 to val 1010
    -- dir_reg is 0 for half, 1 for other half of runtime
    -- Count will first decrement, then increment after dir_reg becomes 1
    -- Should underflow to 1010 and overflow at 1010 to 0000
    ----------------------------------------------------------------------------

--        en_tb <= '1';
--        clk_en_tb <= '1';
 
--        updn_proc: process  --Process for updn, affects when dir changes dir_reg
--        begin
--            wait for 264ns;
--            updn_tb <= '1';
--            wait for 256ns;
--            updn_tb <= '0';
--            wait for 248ns;
--            updn_tb <= '1';
--            wait for 256ns;
--            updn_tb <= '0';
--        end process updn_proc;
        
--        dir_proc: process   -- Process for dir, affects dir_reg and direction of counting
--        begin
--            wait for 256ns;
--            dir_tb <= '1';
--            wait for 256ns;
--            dir_tb <= '0';
--        end process dir_proc;
        
--        ld_proc: process    -- Process for ld and val, affects val_reg
--        begin
--            wait for 8ns;
--            ld_tb <= '1';
--            wait for 8ns;
--            ld_tb <= '0';
--            wait for 496ns;
--        end process ld_proc;


--------------- Component Instantiation for test benching fancy_counter ------------------------
    dut: fancy_counter
    Port Map(   clk => clk_tb,
                clk_en => clk_en_tb, 
                en => en_tb, 
                rst => rst_tb,
                dir => dir_tb, 
                updn => updn_tb, 
                ld => ld_tb, 
                val => val_tb, 
                cnt => cnt_tb);

end fancy_counter_arch_tb;