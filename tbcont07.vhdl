entity tbcont07 is end;

library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_cont of tbcont07 is

component cont07 
    port(
       clock, clear : in  std_logic;
        S     : out std_logic_vector(2 downto 0)  
    );
end component;

signal sclock, sclear : std_logic;
signal sS : std_logic_vector(2 downto 0); 

begin
    cont : cont07 port map (clock => sclock, clear => sclear, S => sS);    

    clock_process : process
        begin
            sclock <= '1';
            wait for 10 ns;
            sclock <= '0'; 
            wait for 10 ns;            
    end process clock_process;

    estimulo : process
        begin
            sclear <= '1';
            wait for 20 ns;
            sclear <= '0';--O CLEAR É LIGADO NA SUBIDA DO CLOCK
            wait for 20 ns;                
    end process estimulo;
end tb_cont;




