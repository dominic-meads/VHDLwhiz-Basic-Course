library ieee;
use ieee.std_logic_1164.all;

entity T10_std_logic_tb is 
end entity;

architecture sim of T10_std_logic_tb is

  signal signal_1 : std_logic := '0';
  signal signal_2 : std_logic;
  signal signal_3 : std_logic;

begin 

  process is 
  begin 
    wait for 10 ns;
    signal_1 <= not signal_1;
  end process;

  -- Driver A
  process is
  begin
  
    signal_2 <= 'Z';
    signal_3 <= '0';
    wait;

  end process;

  -- Driver B
  process (signal_1) is 
  begin
    if signal_1 = '0' then 
      signal_2 <= 'Z';
      signal_3 <= 'Z';
    else 
      signal_2 <= '1';
      signal_3 <= '1';
    end if;
  end process; 

end architecture;