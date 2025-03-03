library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity T17_flip_flop_tb is
end entity;
  
architecture sim of T17_flip_flop_tb is
 
    signal clk   : std_logic := '1';
    signal rst_n : std_logic := '0';
    signal din   : std_logic := '0';
    signal dout  : std_logic;
  
begin

    uut : entity work.T17_flip_flop(rtl)
      port map(
        clk   => clk,
        rst_n => rst_n,
        din   => din,
        dout  => dout
      );
  
    CLK_PROC : process is 
    begin 
      wait for 10 ns;
      clk <= not clk;
    end process CLK_PROC;
  
    STIM_PROC : process is 
    begin 
      rst_n <= '1';
      wait for 20 ns;
      din <= '1';
      wait for 22 ns;
      din <= '0';
      wait for 6 ns;
      din <= '1';
      wait for 20 ns;
      rst_n <= '0';
      wait;
    end process STIM_PROC;

end architecture;