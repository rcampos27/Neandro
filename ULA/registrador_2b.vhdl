library ieee;
use ieee.std_logic_1164.all;

entity registrador_2b is
    port(
        b               : in std_logic_vector(1 downto 0);
	c, clock, clear : in  std_logic;
        Q               : out std_logic_vector(1 downto 0)    
    );
end entity;

architecture behavior of registrador_2b is
    component registrador_1b is
        port(
            b, c, clock, clear : in  std_logic;
            Q                  : out std_logic    
        );
    end component;

begin
    u_reg_b1 : registrador_1b 
        port map(b(1), c, clock, clear, Q(1));
    u_reg_b0 : registrador_1b 
        port map(b(0), c, clock, clear, Q(0));
    
end architecture;
