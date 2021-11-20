------------------------------------------------------------------
-- File:						dafsm_tb.vhd
-- Date:						20211028
-- Author:					F. D. Farall, R. N. Trozzo
-- Descrption:				Testbench for the FIR (dafsm) module
------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

------------------------------------------------------------------
-- Entity
------------------------------------------------------------------
entity dafsm_tb is
end entity dafsm_tb;

------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------
architecture dafsm_tb_arc of dafsm_tb is
	signal clk  : std_logic := '0';
   signal x_0	: std_logic_vector (2 downto 0) := "001";
   signal x_1, x_2	: std_logic_vector (2 downto 0) := "000";
	signal y : integer range 0 to 63;
begin

	-- Create an entity of the dafsm module
	fir_filter : entity work.dafsm(flex)
		port map (
			clk => clk,
			x_in0 => x_0,
			x_in1 => x_1,
			x_in2 => x_2,
			y     => y
		);
		
	-- Generate the signals for the testbench
	clk <= not clk after 10ns;
	x_0 <= "000" after 100ns;
	x_1 <= x_0 after 100ns;
	x_2 <= x_1 after 100ns;
	
end architecture dafsm_tb_arc;
	