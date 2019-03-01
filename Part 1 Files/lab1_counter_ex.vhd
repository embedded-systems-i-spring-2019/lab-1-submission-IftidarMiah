library IEEE;
use IEEE.std_logic_1164.all;

entity counter_tb is
end counter_tb;

architecture tb of counter_tb is

  component counter
  port (
    clk : in std_logic;
    cnt : out std_logic_vector (3 downto 0)
  );
  end component;

  signal tb_clk : std_logic := '0';
  signal tb_cnt : std_logic_vector (3 downto 0) := (others => '0');
  
begin

  dut: counter port map (clk => tb_clk, cnt => tb_cnt);

  process begin
    for iter in 0 to 15 loop
      tb_clk <= '0';
      wait for 1 ns;
      tb_clk <= '1';
      wait for 1 ns;
    end loop;
  end process;
  
end tb;