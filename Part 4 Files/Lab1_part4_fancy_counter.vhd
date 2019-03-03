-- Lab 1 Iftidar Miah
-- Fancy Counter entity and architecture. For use with component in Lab1_part4_counter_top.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fancy_counter is
    port(   clk, clk_en, en, rst, dir, updn, ld : in    std_logic;
            val                                 : in    std_logic_vector(3 downto 0);
            cnt                                 : out   std_logic_vector(3 downto 0));
end fancy_counter;

architecture fancy_counter_arch of fancy_counter is
    signal dir_reg  : std_logic := '0';                                 -- Registers for dir and val
    signal val_reg  : std_logic_vector(3 downto 0) := "1111";           -- Initialize to 1111  
    signal counter    : std_logic_vector(3 downto 0) := "0101"; -- Intermediate signal for cnt
begin
    
    cnt <= counter;
    
    cnt_proc: process(clk)
    begin
        if rising_edge(clk) then   
            if (en = '1') then             -- Only operate if enable = 1
                if (rst = '1') then       
                    counter <= (others => '0'); -- Reset count if rst = 1 and en = 1.
                else
                    if (clk_en = '1') then      -- If en=1, rst=0, then clk_en=0 will change nothing,
                                                -- clk_en = 1 will allow normal operation
                                                
                        if (dir_reg = '1') then         -- If dir_reg = 1, then count up to val
                            if (counter >= val_reg) then
                                counter <= (others => '0');     -- Overflow into 0000
                            else 
                                -- Increment counter
                                counter <= std_logic_vector(unsigned(counter) + 1);
                            end if;
                        else                            -- If dir_reg /= 1, then count down to 0000
                            if (counter = "0000") then
                                counter <= val_reg;     -- Underflow to val_reg
                            else
                                -- decrement counter
                                counter <= std_logic_vector(unsigned(counter) - 1);
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process cnt_proc;
    
    dir_proc: process(clk)  -- Process to change direction at pos edge of clock
    begin
        -- During normal operation, only update direction register if updn = 1. 
        -- Otherwise stays the same direction.
        if (rising_edge(clk) AND en = '1' AND clk_en = '1' AND updn = '1') then
            dir_reg <= dir;
        end if;
    end process dir_proc;
    
    val_proc: process(clk)  -- Process to save value into value register
    begin
        -- During normal operation, load val into register when ld = 1
        -- Otherwise val_reg stays the same
        if (rising_edge(clk) AND en = '1' AND clk_en = '1' AND ld = '1') then
            val_reg <= val;
        end if;
    end process val_proc;
    
end fancy_counter_arch;