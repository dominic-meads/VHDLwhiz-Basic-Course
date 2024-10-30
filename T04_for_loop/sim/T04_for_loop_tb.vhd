entity T04_ForLoopTb is
  end entity;
    
  architecture sim of T04_ForLoopTb is
  begin
    
      process is
      begin
    
          for i in 1 to 10 loop
            report "i=" & integer'image(i);  -- to print in VHDL, must be string, integer'image(i) converts i to a string
          end loop;
          wait;
            
      end process;
    
  end architecture;