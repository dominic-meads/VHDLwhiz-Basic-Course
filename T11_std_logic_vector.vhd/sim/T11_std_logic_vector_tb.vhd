library ieee;
use ieee.std_logic_1164.all;

entity T11_std_logic_vector_tb is 
end T11_std_logic_vector_tb;

architecture sim of T11_std_logic_vector_tb is 

  signal Slv1 : std_logic_vector(7 downto 0);
  signal Slv2 : std_logic_vector(7 downto 0) := (others => '0'); 
  signal Slv3 : std_logic_vector(7 downto 0) := (others => '1');
  signal Slv4 : std_logic_vector(7 downto 0) := x"AA";
  signal Slv5 : std_logic_vector(0 to 7)     := "10101010"; -- indexing of bits are different
  signal Slv6 : std_logic_vector(7 downto 0) := "00000001";

begin 

  process is 
  begin 
    
    wait for 10 ns;
  
    -- shift register
    --for i in 7 downto 1 loop
    --  Slv6(i) <= Slv6(i-1);
    --end loop;

    --Slv6(0) <= Slv(7); 

    -- shift register with attributes (if signal size changes)
    for i in Slv6'left downto Slv6'right + 1 loop
      Slv6(i) <= Slv6(i-1);
    end loop;

    Slv6(Slv6'right) <= Slv6(Slv6'left); -- create feedback loop 

  end process;

end sim;