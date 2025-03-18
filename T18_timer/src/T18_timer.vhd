library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T18_timer is
  generic (
    CLK_HZ : integer
  ); 
  port (
    clk     : in std_logic;
    rst_n   : in std_logic;
    seconds : inout integer;
    minutes : inout integer;
    hours   : inout integer
  );
end entity;

architecture rtl of T18_timer is

  signal ticks : integer := 0;

begin

  process(clk) is 
  begin
    if rising_edge(clk) then
      if rst_n = '1' then 
        ticks   <= 0;
        seconds <= 0;
        minutes <= 0;
        hours   <= 0;
      else 
        if ticks = CLK_HZ - 1 then 
          ticks <= 0;
            -- True once every minute
            if seconds = 59 then
              seconds <= 0;

              -- True once every hour
              if minutes = 59 then
                  minutes <= 0;
                  
                  -- True once a day
                  if hours = 23 then
                      hours <= 0;
                  else
                      hours <= hours + 1;
                  end if;
              else
                  minutes <= minutes + 1;
              end if;
          else
              seconds <= seconds + 1;
          end if;
        else 
          ticks <= ticks + 1;
        end if;
      end if;
    end if;

  end process;

end architecture;