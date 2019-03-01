-- Lab 1 Iftidar Miah
-- Clock counter, outputs clock enable (div) for dividing the clock, lights up led0 with synchronous dff with 2 Hz clock enable div

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider_top is
    port(   clk	    : in	std_logic;          -- 125 Mhz clock = 8ns per rising edge
            led0    : out   std_logic);         -- output of DFF, will be inverted and placed back into D
end divider_top;

---------- Divider_top architecture ------------
architecture divider_top_arch of divider_top is
    signal D, div, C, CE       : std_logic;
    signal Q                : std_logic := '0';
    
    component clock_div
        port(   clk     : in std_logic;
                div     : out std_logic);
    end component;

begin
    
    C <= clk;        
    CE <= div;
    D <= (NOT Q);
    
    dff: process (C)
    begin
        if (CE = '1') then
           if rising_edge(C) then
              Q <= D;
           end if;
       end if;
    end process dff;
    
    led0 <= Q;
            
    U1: clock_div 
        Port Map(   clk     => clk,
                    div     => div);
    
end divider_top_arch;

------------ Entity and arch, to be used for component clock_div instances ------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clock_div is
    port(   clk     : in    std_logic;
            div     : out   std_logic);
end clock_div;

architecture clock_div_arch of clock_div is
    signal counter  : std_logic_vector(25 downto 0) := (others => '0');  -- clock counter, goes up to division ratio 62500000
begin
    count: process(clk)     -- process checks changes in clk
    begin
        if rising_edge(clk) then    -- Exec if rising edge clk      
            counter <= std_logic_vector(unsigned(counter) + 1); -- increment counter
            if (unsigned(counter) = 62500000) then  -- Reset counter when it reaches 62500000, set div to 1 for 8ns = clk period.
                div <= '1';
                counter <= (others => '0');         
            else
                div <= '0';
            end if;
        end if;    
    end process count;

end clock_div_arch;