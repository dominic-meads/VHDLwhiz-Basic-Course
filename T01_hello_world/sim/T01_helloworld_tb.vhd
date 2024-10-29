entity T01_helloworld_tb is   -- inputs and outputs go here, none for a testbench file
end entity;

architecture sim of T01_helloworld_tb is
begin 

    process is  -- processes are executed sequentially
    begin 

      report "Hello World!";  -- printing to screen
      wait;

    end process; 


end architecture;