entity T05_while_loop_tb is
end entity;

architecture sim of T05_while_loop_tb is
begin 

  process is
    variable i : integer := 0;  -- variables can only exists inside process
  begin
    while i < 10 loop
      report "i=" & integer'image(i);  -- report uses strings, so must change integer i into a string using 'image()
      i := i + 2;  -- := is assignment for variable, you CAN increment and decrement by more than 1 on while loop
    end loop;
    wait;  -- must have wait statment in process loop
  end process;

end architecture;
