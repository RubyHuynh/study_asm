; 07/03/2020 23:30 relax cat music!
; data: The data section is used for declaring initialized data or constants. 
;       This data does not change at runtime. You can declare various constant values, file names, or buffer size.
; text: code
; bss: declaring variables
; COMPILE: 
;    nasm -f elf hi.asm ---> generated hi.o
;    ld -m elf_i386 hi.o ----> generated a.out
;
; [label]   mnemonic   [operands]   [;comment]

section	.data
    msg db 'hi, cruel foxy overthere', 0xa  ;string to be printed
    len equ $ - msg     ;length of the string

section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel
