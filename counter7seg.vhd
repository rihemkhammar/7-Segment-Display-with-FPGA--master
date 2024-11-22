library ieee;

use ieee.std_logic_1164.all;

-- use ieee.std_logic_arith.all;  -- déconseillée non ieee

--use ieee.numeric_std.all;

-- use ieee.std_logic_unsigned.all;  -- déconseillée non ieee



entity counter7seg is  

PORT (

  rst, CLK : IN std_logic ;

        Seg : OUT std_logic_vector (7 downto 0) 

          );

END counter7seg ;





ARCHITECTURE arch OF counter7seg IS



SIGNAL cnt : natural range 0 to 9;

SIGNAL count : natural range 0 to 25000000 :=0 ;

signal clk1hz : std_logic :='0';





BEGIN



PROCESS (clk)           -- process clock div

BEGIN

if (clk'EVENT AND clk='1') then

count <= count + 1;

  if count=25000000-1 then

    clk1hz <= not clk1hz;

    count<=0;

  end if;

end if;

END PROCESS ;





PROCESS (clk1hz,rst)    --  process couter

BEGIN

if rst ='0' then

 cnt <= 0 ;

elsif (clk1hz'EVENT AND clk1hz='1')

THEN 

if cnt= 9 then

  cnt <= 0;

else 

cnt <= cnt + 1;

end if;

END IF ;

END PROCESS ;



Process (cnt)    -- process display

Begin

Case cnt is 
when 0 => seg <= "11000000";
when 1 => seg <= "11111001";
when 2 => seg <= "10100100";
when 3 => seg <= "10110000";
when 4 => seg <= "10011001";
when 5 => seg <= "10010010";
when 6 => seg <= "10000010";
when 7 => seg <= "11111000";
when 8 => seg <= "10000000";
when 9 => seg <= "10010000";  
When others => seg <= "11111111";
end case;


End process;

END arch;