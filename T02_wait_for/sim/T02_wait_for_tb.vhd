entity T02_wait_for_tb is
  end entity;
   
  architecture sim of T02_wait_for_tb is
  begin
   
      process is
      begin
          -- This is the start of the process "thread"
   
          report "Peekboo!";
   
          wait for 10 ns;
   
          -- The process will loop back to the start from here
      end process;
   
  end architecture;