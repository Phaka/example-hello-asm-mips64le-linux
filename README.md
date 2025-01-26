# Hello World in MIPS64LE Assembly (Linux)

A simple Hello World implementation in MIPS64LE assembly language for Linux systems. This implementation is specifically for little-endian MIPS64 processors, which are more common in modern systems than their big-endian counterparts.

## Installation

On a MIPS64LE Linux system, you'll need the standard GNU toolchain:

```bash
sudo apt-get update
sudo apt-get install binutils gcc
```

## Running

Assemble and link:
```bash
as -o main.o main.s -EL
ld -o hello main.o -EL
./hello
```

## Code Explanation

Our MIPS64LE implementation is similar to the big-endian version but has some important differences:

1. The assembler and linker must be explicitly told to use little-endian mode (-EL flag)
2. Data structures in memory will be stored with reversed byte order compared to big-endian MIPS64
3. Load/store instructions will automatically handle the endianness conversion

The program uses the same register conventions as big-endian MIPS64:
- $v0: System call number
- $a0-$a2: Function arguments and system call parameters

Key differences from big-endian MIPS64:
- Memory accesses are little-endian (least significant byte first)
- Multi-byte immediates are stored in little-endian order
- String data is stored in natural order (endianness doesn't affect byte-by-byte data)

The assembler flags (-EL) ensure:
- Instructions are assembled for little-endian mode
- Data is properly aligned for little-endian access
- Address calculations account for little-endian byte order

Note that while the assembly code looks identical to the big-endian version, the binary output and memory layout will be different due to the endianness change.
