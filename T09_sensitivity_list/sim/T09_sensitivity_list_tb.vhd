entity T09_sensitivity_list_tb is
end entity;

architecture sim of T09_sensitivity_list_tb is
-- declaritive region

  signal CountUp   : integer := 0;
  signal CountDown : integer := 10;

begin 

  process is 
  begin 
    CountUp   <= CountUp + 1;
    CountDown <= CountDown - 1;
    wait for 10 ns;  -- every process WITHOUT sensitivity list needs a wait statement
  end process;

  -- process is triggered by wait on
  process is 
  begin 
    if CountUp = CountDown then 
      report "Process A: Jackpot!";
    end if;

    wait on CountUp, CountDown;
  end process;

  process(CountUp, CountDown) is 
  begin 
    if CountUp = CountDown then 
      report "Process B: Jackpot!";
    end if;
  end process;

end architecture;