-----------------------------------------------------------------------------------
-- File:        fir_tb.vhd
-- Date:        20211028
-- Author:      Gonzalo J. Davidov and Lucas A. Kammann
-- Description: Testbench for FIR implementations
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- Package
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- Entity
-----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.integer_package.all;

entity fir_tb is
end entity fir_tb;

-----------------------------------------------------------------------------------
-- Architecture
-----------------------------------------------------------------------------------
architecture fir_tb_arch of fir_tb is
    signal x    : byte;
    signal y    : byte;
    signal clk  : std_logic := '0';
begin

    -- Create an instance of the device under test
    dut: entity work.fir(pipeline_fir)
            port map (
                clk => clk,
                x => x,
                y => y
            );

    -- Create signals for the testbench
    clk <= not clk after 100 ns;
    x <= 10, 0 after 150 ns;
 
end architecture fir_tb_arch;