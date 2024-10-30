entity T03_loop_tb is 
end T03_loop_tb;

architecture sim of T03_loop_tb is 
begin 

  process is 
  begin 
    report "Hello World!";

    loop
      report "Peekaboo!";
      exit;  -- terminate loop
    end loop;

    report "Goodbye";
    wait;
  end process;

end sim;

