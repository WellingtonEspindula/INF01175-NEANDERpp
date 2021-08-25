# INF01175-NEANDER++
Neander++ (Neander with some extensions) __implementation__ and __testing__ in VHDL for Digital Systems' 2nd assignment. <br>
[Neander](http://www.inf.ufrgs.br/arq/wiki/doku.php?id=neander) is an one accumulator hypothetical processor architecture created by Professor Raul Weber.

### Neander++ ISA
- 8 bits data and address width
- 2's complement data representation
- 8 bits accumulator (AC)
- 8 bits program counter (PC)
- 1 state registers for 2 conditional codes: 'N' for negative value and 'Z' for zero value

|Código|Instrução|Operação|
|-|-|-|
|0000|NOP|No operation|
|0001|STA end|Stores accumulator value under the memory's address refered by “end”|
|0010|LDA end|Loads the value of memory's addresss "end" under the accumulator|
|0011|ADD end|Sums the value of the mem's addr "end" to the accumulator value|
|0100|OR end|"OR" operation over the value of the mem's addr "end" to the accumulator value|
|0101|AND end|"AND" operation over the value of the mem's addr "end" to the accumulator value|
|0110|NOT|Inverts the accumulator value's bits|
|0111*|SUB end|Subtracts the value of the mem's addr "end" to the accumulator value|*
|1000|JMP end|Unconditional Jump to mem's address "end"|
|1001|JN end|Conditional Jump to mem's address "end" if "N=1"|
|1010|JZ end|Conditional Jump to mem's address "end" if "Z=1"|
|1011*|XOR end|"XOR" operation over the value of the mem's addr "end" to the accumulator value|
|1111|HLT|Halt|

_\* This operation wasn't defined in the original Neander's ISA. It means that it's an extensions instruction_

### Neander++ Organization/Microarchitecture
#### Datapath (Operative Block)
The schematic of the operative block follows the image below. <br>
<img src="imgs/schematic.svg"> <br>
The datapath main file is [neander.vhd](blob/master/sources_1/new/neander.vhd) which instantied the other components.<br>
The memory (instruction and data memory) is an instance of a single port BRAM IP. It was generated 4 main memories which represents differents programs written .coe. Those program's assembly are descripted in main directory (neander_[#program].ned).

#### Control Unit (Control Block)
(WIP)

For more details, you can consult the [assingment statement](/blob/master/neander_enunciado.pdf) and the [assignment presentation](/blob/master/Presentation.pdf). Although, both were written in Portuguese.


## Author
Wellington Espindula - Main author <br>
Fernanda Lima Kastensmidt, Ph.D. - Digital Systems' Professor
