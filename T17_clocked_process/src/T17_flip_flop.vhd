library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T17_flip_flop is 
  port(
    clk   : in std_logic;
    rst_n : in std_logic;
    din   : in std_logic;
    dout  : out std_logic
  );
end entity;

architecture rtl of T17_flip_flop is 

  signal r_dout : std_logic := '0';

begin 

  process(clk) is
  begin 
    if rising_edge(clk) then 
      if rst_n = '0' then -- synchronous reset
        r_dout <= '0';
      else
        r_dout <= din;
      end if;
    end if;
  end process;

  dout <= r_dout; 

end architecture;