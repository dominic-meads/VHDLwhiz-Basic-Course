entity T07_wait_on_until_tb is 
end entity;

architecture sim of T07_wait_on_until_tb is 
-- declaritive region of architecture
  signal count_up : integer := 0;  -- signals are global
  signal count_down : integer := 10;  -- signals are global

begin 

  process is 
  begin 
    count_up   <= count_up + 1;
    count_down <= count_down - 1;
    wait for 10 ns;
  end process;

  process is 
  begin 
    wait on count_up, count_down;  -- wait until one of these changes value
    report "count_up = " & integer'image(count_up) &
       ", count_down = " & integer'image(count_down);
  end process; 

  process is 
  begin 
    wait until count_up = count_down;
    report "jackpot!";
  end process;

end architecture;