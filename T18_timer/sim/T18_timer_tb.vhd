library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T18_timer_tb is 
end entity;

architecture sim of T18_timer_tb is

  constant CLK_HZ     : integer := 10; -- 10 Hz
  constant CLK_PERIOD : time := 1000 ms / CLK_HZ;

  signal clk     : std_logic := '0';
  signal rst_n   : std_logic := '1';
  signal seconds : integer;
  signal minutes : integer;
  signal hours   : integer;

begin

  uut : entity work.T18_timer(rtl)
    generic map(
      CLK_HZ => CLK_HZ
    )
    port map(
      clk     => clk,
      rst_n   => rst_n,
      seconds => seconds,
      minutes => minutes,
      hours   => hours
    );

  CLK_PROC : process is 
  begin
    wait for CLK_PERIOD / 2;
    clk <= not clk;
  end process CLK_PROC;

  STIM_PROC : process is 
  begin 
    wait until rising_edge(clk);
    wait until rising_edge(clk);

    -- Take the DUT out of reset
    rst_n <= '0';

    wait;
  end process STIM_PROC;

end sim ; -- sim