library ieee;
use ieee.std_logic_1164.all;

entity uc is
    port(
        E : in std_logic_vector (10 downto 0); 
        S : out std_logic_vector (9 downto 0);
    );
end entity;

architecture comportamento of uc is

-- BLOCK
signal sBlock, sNBlock : std_logic;

-- NOP
component NOP is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end component;

signal NOPstep: std_logic_vector(2 downto 0);
signal NOPoutput : std_logic_vector(10 downto 0)

-- LDA
component LDA is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end component;

signal LDAstep: std_logic_vector(2 downto 0);
signal LDAoutput: std_logic_vector(10 downto 0);


end architecture;
    
