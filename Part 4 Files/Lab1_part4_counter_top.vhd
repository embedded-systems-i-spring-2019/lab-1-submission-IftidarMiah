-- Lab 1 Iftidar
-- Counter Top, combines the fancy counter, clock div, and 4 instances of debounce with structural modeling

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_top is
    port(   clk         : in    std_logic;
            btn, sw     : in    std_logic_vector(3 downto 0);
            led         : out   std_logic_vector(3 downto 0));
end counter_top;

architecture counter_top_arch of counter_top is
    signal dbnc     : std_logic_vector(3 downto 0);     -- Outputs of 4 debounce circuits
    signal div      : std_logic;                        -- 2 Hz Output of clock div
    
    -- Component clock div, mapped ports at bottom with 1 instance
    -- Uses entity and arch from lab1_part4_clock_div.vhd
    component clock_div
        port(   clk    : in    std_logic; -- 125 Mhz clock = 8ns per rising edge
                div    : out    std_logic); -- output clock enable
    end component;
    
    -- Component debounce, mapped ports at bottom with 4 instances. 
    -- Uses entity and arch from lab1_part4_debounce.vhd
    component debounce 
        port(   clk, btn    : in    std_logic;
                dbnc         : out   std_logic);
    end component;
    
    -- Component fancy_counter, mapped ports at bottom with 1 instance. 
    -- Uses entity and arch from lab1_part4_fancy_counter.vhd
    component fancy_counter
        port(   clk, clk_en, en, rst, dir, updn, ld : in    std_logic;
                val                                 : in    std_logic_vector(3 downto 0);
                cnt                                 : out   std_logic_vector(3 downto 0));
    end component;
    
begin
    
    -- 4 Instances of debounce taking in btns 0 to 3 respectively and clk, and outputs 4 dbnc signals 
    u1: debounce
        Port Map(   clk     => clk,
                    btn     => btn(0),
                    dbnc    => dbnc(0)       
        );
        
    u2: debounce
        Port Map(   clk     => clk,
                    btn     => btn(1),
                    dbnc    => dbnc(1)       
        );
    
    u3: debounce
        Port Map(   clk     => clk,
                    btn     => btn(2),
                    dbnc    => dbnc(2)       
        );
    
    u4: debounce
        Port Map(   clk     => clk,
                    btn     => btn(3),
                    dbnc    => dbnc(3)       
        );
    
    -- 1 instance of clock_div taking clk and outputting 2 Hz div
    u5: clock_div
        Port Map(   clk     => clk,
                    div     => div
        );
        
    -- 1 instance of fancy_counter takes various inputs from clk, dbnc, clock div, and outputs 4 LED counter
    u6: fancy_counter
        Port Map(   clk     => clk,
                    clk_en  => div,
                    en      => dbnc(1),
                    rst     => dbnc(0),
                    dir     => sw(0),
                    updn    => dbnc(2), 
                    ld      => dbnc(3), 
                    val     => sw, 
                    cnt     => led
        );

end counter_top_arch;