entity tbdec is end; --entidade sem entradas/saidas

library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_decod of tbdec is

component dec --nome do arquivo q vai testar
    port( --declaração entrada/saida da entidade do 'dec'
        E   : in std_logic_vector(3 downto 0);
        S   : out std_logic_vector(10 downto 0)
    );
end component;

signal sE   : std_logic_vector(3 downto 0);

begin
    dec1 : dec port map (E => sE, S => open);    

estimulo : process
begin
    sE <= "0000"; 
    wait for 10 ns; sE <= "0001";
    wait for 10 ns; sE <= "0010";
    wait for 10 ns; sE <= "0011"; 
    wait for 10 ns; sE <= "0100";
    wait for 10 ns; sE <= "0101";                        
    wait for 10 ns; sE <= "0110";            
    wait for 10 ns; sE <= "0111";            
    wait for 10 ns; sE <= "1000";            
    wait for 10 ns; sE <= "1001";            
    wait for 10 ns; sE <= "1010";   
    wait for 10 ns;           
                  
end process estimulo;
end tb_decod;



