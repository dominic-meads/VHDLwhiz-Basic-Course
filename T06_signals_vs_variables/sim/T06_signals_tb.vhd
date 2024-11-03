entity T06_signals_tb is 
end entity;

architecture sim of T06_signals_tb is 
-- declaritive region of architecture
  signal my_signal : integer := 0;  -- signals are global

begin 

  process is 
    variable my_variable : integer := 0;  -- variables are local only to process
  begin 

    report "*** Process begin ***";

    my_variable := my_variable + 1;  -- variables update immediatley
    my_signal <= my_signal + 1;  -- notice different assignment operator

    report "my_variable=" & integer'image(my_variable) &
        ", my_signal=" & integer'image(my_signal);

    my_variable := my_variable + 1;
    my_signal   <= my_signal + 1;
    -- assigning to signals multiple times before a wait statement will result   
    -- in the last assignment actually working. Others before it are ignored

    report "my_variable=" & integer'image(my_variable) &
        ", my_signal=" & integer'image(my_signal);

    wait for 10 ns; -- when process pauses, the signal wiil update

    report "my_variable=" & integer'image(my_variable) &
        ", my_signal=" & integer'image(my_signal);

  end process;

end architecture;