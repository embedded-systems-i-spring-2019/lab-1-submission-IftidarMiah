-- Lab 1 Iftidar Miah
-- Debounce entity and architecture, for use with component in Lab1_part4_counter_top.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity debounce is
    port(   clk, btn    : in    std_logic;
            dbnc         : out   std_logic);
end debounce;

architecture debounce_arch of debounce is
    signal count    : std_logic_vector(2 downto 0) := (others => '0'); -- 3 bit counter signal
    signal shift    : std_logic_vector(1 downto 0) := (others => '0'); -- 2 shift register

begin
    
    debounce: process(clk)
    begin
        if rising_edge(clk) then
            shift <= shift(0) & btn;    -- Shift left 1, put btn at shift(0)
                
            if ((shift(1) = '1') AND (unsigned(count) /= 4)) then      -- Check if shift(1) = 1 then check and increment counter                                        
                count <= std_logic_vector(unsigned(count) + 1);     -- Increment count when shift(0) = 1 and count < 4
            elsif ((shift(1) = '1') AND (unsigned(count) = 4)) then
                dbnc <= '1';        -- When count = 4, debounce output = 1. Now count and dbnc won't change until next shift(0) = 0
            else
                dbnc    <= '0';
                count <= (others => '0');           -- Reset count if shift(0) = 0
            end if;
        end if;
    end process debounce;

end debounce_arch;