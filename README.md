## Project File Structure
**project-name/** : Top level directory of the Quartus Prime project
* **assets/**: Assets for projects (for example, development kit pin assignments) 
* **bdf/** : Block diagram or schematic files (.bdf)
* **hdl/** : HDL files (.v or .vhdl)
  *  **generated/** : Verilog files generated by Quartus Prime from a block diagram or schematic file
* **simulation/** : Simulation waveform files for the Simulation Waveform Editor of Quartus Prime (.vwf) 
* **symbols/** : Generated symbol files (.bsf)
* **tests/** : Verilog HDL testing or testbench files (.v)
* **waves/** : Waveforms for ModelSim Altera (.do)
* *project-name.bdf* : Top level block diagram or schematic
* *project-name.qpf* : Quartus Prime project file
* *project-name.qps* : Quartus Prime settings file
