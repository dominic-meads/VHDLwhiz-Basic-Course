library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T13_concurrent_assignment_tb is 
end entity;

architecture sim of T13_concurrent_assignment_tb is 

signal Uns  : unsigned(5 downto 0) := (others => '0');
signal Mul1 : unsigned(7 downto 0) := (others => '0');
signal Mul2 : unsigned(7 downto 0) := (others => '0');
signal Mul3 : unsigned(7 downto 0) := (others => '0');


begin 

  process is
  begin
    
    Uns <= Uns + 1;

    wait for 10 ns;
  end process;

  -- process multiply by 4
  process is
  begin 
    Mul1 <= Uns & "00";  -- sort of a left shift by 2 (2^2 = 4)

    wait on Uns;

  end process;

  process(Uns) is -- process with sensitivity list is equivalent to process with a "wait on" statement at the end
  begin 
    
    Mul2 <= Uns & "00";

  end process;
  
  -- equivalent process with concurrent statement
  Mul3 <= Uns & "00";

end architecture;