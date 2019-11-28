library ieee;
use ieee.std_logic_1164.all;

entity ff_tipo_d is
    port (
        D, clock       : in  std_logic;
	preset, clear  : in  std_logic;
	Q, nQ          : out std_logic
); 	
end entity;

architecture behavior of ff_tipo_d is
    component ffjk is
     	port (  
     	   J, K, clock   : in  std_logic;
     	   preset, clear : in std_logic;
     	   Q, nQ         : out std_logic
    	);
    end component;
    	signal notD : std_logic;
begin
    notD <= not D;
    u_fft : ffjk
	port map(D, notD, clock, preset, clear, Q, nQ);
end architecture;
