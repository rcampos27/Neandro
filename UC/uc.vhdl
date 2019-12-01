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

-- ADD
component ADD is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end component;

signal ADDstep : std_logic_vector(2 downto 0);
signal ADDoutput : std_logic_vector (10 downto 0);

-- AND
component ANDD is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end component;

signal ANDstep : std_logic_vector(2 downto 0);
signal ANDoutput : std_logic_vector (10 downto 0);

-- NOT
component NOTT is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end component;

signal NOTstep : std_logic_vector(2 downto 0);
signal NOToutput : std_logic_vector (10 downto 0);

-- OR
component ORR is
port (
	step   : in  std_logic_vector(2 downto 0);
	output : out std_logic_vector(10 downto 0)
);
end component;

signal ORstep : std_logic_vector(2 downto 0);
signal ORoutput : std_logic_vector (10 downto 0);
    
end architecture;
