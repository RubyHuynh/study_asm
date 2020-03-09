#!/bin/sh
echo "compiling asm..." $1
nasm -f elf $1 -o object.o
ld -m elf_i386 object.o
echo "done :D"