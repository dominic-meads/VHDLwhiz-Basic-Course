library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T16_generic_map_tb is 
end entity;

architecture sim of T16_generic_map_tb is 

  constant DATA_WIDTH : integer := 8;

  signal Sig1 : unsigned(DATA_WIDTH-1 downto 0) := x"AA";
  signal Sig2 : unsigned(DATA_WIDTH-1 downto 0) := x"BB";
  signal Sig3 : unsigned(DATA_WIDTH-1 downto 0) := x"CC";
  signal Sig4 : unsigned(DATA_WIDTH-1 downto 0) := x"DD";
  signal Sel  : unsigned(1 downto 0) := (others => '0');
  signal Out1 : unsigned(DATA_WIDTH-1 downto 0);

begin
  
  uut : entity work.T16_generic_mux(rtl)
    generic map(DATA_WIDTH => DATA_WIDTH)
    port map(
      Sig1 => Sig1,
      Sig2 => Sig2,
      Sig3 => Sig3,
      Sig4 => Sig4,
      Sel  => Sel,
      Out1 => Out1
    );

  -- Testbench process
  process is
  begin
    wait for 10 ns;
    Sel <= Sel + 1;
    wait for 10 ns;
    Sel <= Sel + 1;
    wait for 10 ns;
    Sel <= Sel + 1;
    wait for 10 ns;
    Sel <= Sel + 1;
    wait for 10 ns;
    Sel <= "UU";
    wait;
  end process;

end architecture;