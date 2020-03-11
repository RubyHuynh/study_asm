#!/bin/sh
nasm -f elf $1 -o object.o
ld -m elf_i386 object.o