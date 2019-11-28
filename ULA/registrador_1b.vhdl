library ieee;
use ieee.std_logic_1164.all;

entity registrador_1b is
    port(
        b, c, clock, clear : in  std_logic;
        Q                  : out std_logic    
    );
end entity;

architecture behavior of registrador_1b is
    component mux_2x1 is
        port(
            I0, I1, Sel : in std_logic; 
            S           : out std_logic
        );
    end component;

    component ff_tipo_d is
        port(
            D, clock      : in std_logic; 
            preset, clear : in std_logic; 
            Q, nQ         : out std_logic
        );
    end component;

    signal sMux      : std_logic;
    signal sQ, snQ  : std_logic;

begin
    u_mux : mux_2x1 
        port map(sQ, b, c, sMux);
    
    u_ff_d : ff_tipo_d 
        port map(sMux, clock, '1', clear, sQ, snQ);
    Q <= sQ;

end architecture;
