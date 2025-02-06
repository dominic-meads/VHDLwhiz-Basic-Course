library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T15_Mux is 
  port(
    Sig1 : in unsigned(7 downto 0);
    Sig2 : in unsigned(7 downto 0);
    Sig3 : in unsigned(7 downto 0);
    Sig4 : in unsigned(7 downto 0);
    Sel  : in unsigned(1 downto 0);
    Out1 : out unsigned(7 downto 0)
  );
end entity;

architecture rtl of T15_Mux is 
begin 

  process (Sel, Sig1, Sig2, Sig3, Sig4) is
  begin 
    case Sel is 
      when "00" =>
        Out1 <= Sig1;
      when "01" =>
        Out1 <= Sig2;
      when "10" =>
        Out1 <= Sig3;
      when "11" =>
        Out1 <= Sig4;
      when others =>
        Out1 <= (others => 'X');
    end case;
  end process;

end architecture;