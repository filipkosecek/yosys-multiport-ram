# Yosys n-port RAM tests

## Repository structure
The repository contains a generic n-port RAM implementation used for testing
the BRAM inference by Yosys. The design is parametrized as the the memory size
and number of read ports determines how many BRAM blocks are used. There are
three macros that are used to parametrize the design:
- `RAM_SIZE` - the number of words in RAM
- `WORD_SIZE` - the size of a word 
- `N_PORTS` - the number of read ports
There is a default value for each macro which can be overriden by user-defined
values.

## Synthesis
Yosys tool is required for synthesis which can be obtained from
[its repository](https://github.com/YosysHQ/yosys) and built from source
or it can also be found in package repositories of some distributions
such as Debian. Yosys allows to define macros from the command line
similarly to `gcc`. The usage is as follows:
```
yosys -DWORD_SIZE=x -DRAM_SIZE=y -DN_PORTS=z -p synth_ice40 nport_ram.v
```
If none of the macros are supplied, the default values are used. Yosys should
output the design's resource usage.
