-----------------------------------------------------------------------------------
-- File:        fir.vhd
-- Date:        20211028
-- Author:      Gonzalo J. Davidov and Lucas A. Kammann
-- Description: FIR implementations
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-- Package
-----------------------------------------------------------------------------------
package integer_package is
    subtype byte is integer range -128 to 127;
    type array_byte is array (0 to 3) of byte;
end integer_package;

-----------------------------------------------------------------------------------
-- Entity
-----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.integer_package.all;

entity fir is
    port(
        signal clk  : in std_logic;
        signal x    : in byte;
        signal y    : out byte
    );
end entity fir;

-----------------------------------------------------------------------------------
-- Architecture
-----------------------------------------------------------------------------------
architecture basic_fir of fir is
    signal tap : array_byte := (0, 0, 0, 0);
begin
    fir_process: process
    begin  
        wait until clk = '1';
        y <= 2*tap(1) + tap(1) + tap(1)/2 + tap(1)/4 + 2*tap(2) + tap(2) + tap(2)/2 + tap(2)/4 - tap(3) - tap(0);
        for I in 3 downto 1 loop
            tap(I) <= tap(I-1);
        end loop;
        tap(0) <= x;
    end process fir_process;
end architecture basic_fir;

architecture symmetry_fir of fir is
    signal tap  : array_byte := (0, 0, 0, 0);
    signal t1   : byte := 0;
    signal t2   : byte := 0;   
begin
    fir_process: process
    begin  
        wait until clk = '1';
        t1 <= tap(1) + tap(2);
        t2 <= tap(0) + tap(3);
        y <= 2 * t1 + t1 + t1 / 2 + t1 / 4 - t2;
        for I in 3 downto 1 loop
            tap(I) <= tap(I-1);
        end loop;
        tap(0) <= x;
    end process fir_process;
end architecture symmetry_fir;

architecture csd_fir of fir is
    signal tap  : array_byte := (0, 0, 0, 0);
    signal t1   : byte := 0;
    signal t2   : byte := 0;  
begin
    fir_process: process
    begin  
        wait until clk = '1';
        t1 <= tap(1) + tap(2);
        t2 <= tap(0) + tap(3);
        y <= 4 * t1 - t1/4 - t2;
        for I in 3 downto 1 loop
            tap(I) <= tap(I-1);
        end loop;
        tap(0) <= x;
    end process fir_process;
end architecture csd_fir;

architecture pipeline_fir of fir is
    signal tap  : array_byte := (0, 0, 0, 0);
    signal t1   : byte := 0;
    signal t2   : byte := 0;
    signal t3   : byte := 0;
    signal t4   : byte := 0;
begin
    fir_process: process
    begin  
        wait until clk = '1';
        t1 <= tap(1) + tap(2);
        t2 <= tap(0) + tap(3);
        t3 <= 4 * t1 - t1 / 4;
        t4 <= -t2;
        y <= t3 + t4;
        for I in 3 downto 1 loop
            tap(I) <= tap(I-1);
        end loop;
        tap(0) <= x;
    end process fir_process;
end architecture pipeline_fir;