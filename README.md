# _Neandro_: A VHDL Implementation of a Neander Processor

## Overview
_Neandro_ is a VHDL project that implements a simplified version of the Neander processor. The Neander processor is an educational architecture designed to illustrate the fundamental concepts of computer organization and digital systems. This project also includes minimal visualization of the data in the GHW format.

## Project Structure
The project is organized into several VHDL files, each representing a specific component of the Neander processor. Here is an overview of the key files:

**1. Neander.vhdl:** Main VHDL file representing the Neander and its architecture.
Instantiates components like `PC`, `registrador_8b`, `mux_2x8`, `ULA`, `decoder`, and `as_ram`.
Manages the control flow and data path of the processor.  
  
**2. PC.vhdl:** Implements the Program Counter (PC) component, responsible for managing program flow.

**3. registrador_8b.vhdl:** Represents an 8-bit register used in various parts of the Neander processor.

**4. mux_2x8.vhdl:** Implements an 8-to-1 multiplexer used for data selection.

**5. ULA.vhdl:** Represents the Arithmetic Logic Unit (ULA) responsible for arithmetic and logic operations.

**6. decoder.vhdl:** Implements a decoder used for decoding instruction signals.

**7. as_ram.vhdl:** Represents the memory module used in the Neander processor.

## Contributors
* Rodrigo Abreu Pizzatto de Campos
* Valquíria Prestes Belusso
* Gabriela Guerra
