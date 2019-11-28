library ieee;
use ieee.std_logic_1164.all;

entity registrador_8b is
    port(
        b               : in std_logic_vector(7 downto 0);
	c, clock, clear : in  std_logic;
        Q               : out std_logic_vector(7 downto 0)    
    );
end entity;

architecture behavior of registrador_8b is
    component registrador_1b is
        port(
            b, c, clock, clear : in  std_logic;
            Q                  : out std_logic    
        );
    end component;

begin
    u_reg_b7 : registrador_1b 
        port map(b(7), c, clock, clear, Q(7));
    u_reg_b6 : registrador_1b 
        port map(b(6), c, clock, clear, Q(6));
    u_reg_b5 : registrador_1b 
        port map(b(5), c, clock, clear, Q(5));
    u_reg_b4 : registrador_1b 
        port map(b(4), c, clock, clear, Q(4));
    u_reg_b3 : registrador_1b 
        port map(b(3), c, clock, clear, Q(3));
    u_reg_b2 : registrador_1b 
        port map(b(2), c, clock, clear, Q(2));
    u_reg_b1 : registrador_1b 
        port map(b(1), c, clock, clear, Q(1));
    u_reg_b0 : registrador_1b 
        port map(b(0), c, clock, clear, Q(0));
    
end architecture;
