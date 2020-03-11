;
;nasm -f elf64 z_print_number_noprintf.asm 
;ld -m elf_x86_64 z_print_number_noprintf.o
section .bss

        lena equ 1024
        outbuff resb lena

section .data

section .text

        global _start
        _start:
                nop
                mov r12b,30h

                incre:
                inc r12b
                mov [outbuff],r12b

                mov rax,1           ;sys_write
                mov rdi,1
                mov rsi,outbuff
                mov rdx,1
                syscall

                ;cmp r12b,39h
                ;jl incre

                mov rax,60          ;sys_exit
                mov rdi,0
                syscall