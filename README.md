## Yosys multi-port RAM tests

### Repository structure
The repository contains multiple examples of RAM implementations varying in the RAM word size 
and number of read ports. Each can be found in a separate file. There are no additional modules 
as they are only inteded for testing and experiments. The file names follow pattern 
`xport_ram[{_small,_large}][wordsize].v` with `x` denoting the number of read ports while small/
large specifies the size of RAM. Optional parameter`wordsize` specifies the size of RAM word. 
For example, the file of single port RAM with 32-bit word size is named `1port_ram32.v`.

### Synthesis
Yosys tool is required for synthesis which can be obtained from [their repository] and built from
source or it can also be found in package repositories of some distributions such as Debian. The 
files can then be synthesized by running command:
```
yosys -p synth_ice40 source_file.v
```
The output displays the amount and type of resources used.
