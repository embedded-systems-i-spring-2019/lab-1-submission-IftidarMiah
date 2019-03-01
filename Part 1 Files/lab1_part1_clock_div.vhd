-- Lab 1 Iftidar Miah
-- Clock counter, outputs clock enable (div) for dividing the clock

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clock_div is
	port(	clk	: in	std_logic; -- 125 Mhz clock = 8ns per rising edge
            div	: out	std_logic); -- output clock enable
end clock_div;

architecture clock_div_arch of clock_div is
    signal counter : std_logic_vector(25 downto 0) := (others => '0');  -- 26 bit clock counter, goes up to division ratio 62500000

begin
    count: process(clk)     -- process checks changes in clk
    begin
	if rising_edge(clk) then    -- Exec if rising edge clk      
        	counter <= std_logic_vector(unsigned(counter) + 1); -- increment counter
        	if (unsigned(counter) = 62500000) then  -- Counts up to 62500000 cycles (0.5 s period = 2 Hz)
            		div <= '1';                     -- Set clk enable to 1 every 0.5 s (2 Hz)
            		counter <= (others => '0');     -- Reset counter when it reaches division ratio 62500000
        	else
            		div <= '0';                       -- Keeps clk enable as 0 until division ratio reached
        	end if;
    	end if;        
    end process count;
    
end clock_div_arch;