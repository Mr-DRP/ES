LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY not1 IS PORT (
	a: IN STD_LOGIC;
	o: OUT STD_LOGIC
);
END not1;

ARCHITECTURE behavorial OF not1 IS

BEGIN

PROCESS (a)

	BEGIN
		o <= a NAND a;

END PROCESS;

END behavorial;