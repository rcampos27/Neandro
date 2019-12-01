library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont07 is
    port(
        clock, clear : in  std_logic;
        S            : out std_logic_vector(2 downto 0)    
    );  
end cont07;

architecture contador of cont07 is

signal sS : std_logic_vector(2 downto 0);  

    begin
        processo : process(clock, clear)
        begin
            if clear = '1' then sS <= "000";--QND O CLEAR ESTIVER DESLIGADO A SAIDA PERMANECE EM 0
--E SE O CLEAR ESTIVER LIGADO, ENTRA NO "ELSIF" ABAIXO
            elsif rising_edge(clock) then--AGORA DEPENDE DA PULSADA DO CLOCK  
                if sS /= 7 then sS <= sS + 1;--ENQUANTO O VALOR DA SAIDA FOR DIFERENTE DE 7, O CONTADOR SOMA 1 A SAIDA
                else sS <= "000";--E QUANDO O sS FOR IGUAL A 7, A SAIDA VOLTARA A SER 000
                end if;
            end if;
        end process processo;

        converter : for i in 0 to 2 generate--OS VALORES DO SIGNAL sS VÃO PARA A SAIDA S
            S(i) <= sS(i);
        end generate converter;
end contador;






