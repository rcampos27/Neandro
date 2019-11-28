library IEEE;
use IEEE.std_logic_1164.all;

entity dec is --decodificador 4x11
    port(
        E   : in std_logic_vector(3 downto 0); --4 entradas
        S   : out std_logic_vector(10 downto 0) --11 saidas
    );
end dec;

architecture decod of dec is 
    begin     
            S <= "00000000001" when E = "0000" else
                 "00000000010" when E = "0001" else
                 "00000000100" when E = "0010" else
                 "00000001000" when E = "0011" else 
                 "00000010000" when E = "0100" else
                 "00000100000" when E = "0101" else
                 "00001000000" when E = "0110" else
                 "00010000000" when E = "0111" else
                 "00100000000" when E = "1000" else
                 "01000000000" when E = "1001" else
                 "10000000000" when E = "1010" else
                 "ZZZZZZZZZZZ";
end decod;




