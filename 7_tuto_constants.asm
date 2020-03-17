; 17March2020, 22:20, Constant directives
;   - EQU
;       everything
;   - %assign
;       numeric only
;   - %define
;       #define in C
SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1
%assign TOTAL 10
%define PTR [EBP+4]

section	 .data
    ddd   times TOTAL Dw '*'

    msg1 db	'Hello, programmers!',0xA,0xD 	
    len1 equ $ - msg1			

    msg2 db 'Welcome to the world of,', 0xA,0xD 
    len2 equ $ - msg2 

    msg3 db 'Linux assembly programming! '
    len3 equ $- msg3

section	 .text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, ddd         
   mov edx, TOTAL 
   int 0x80   

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                
	
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg2         
   mov edx, len2 
   int 0x80 
	
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3         
   mov edx, len3 
   int 0x80
   
   mov eax,SYS_EXIT    ;system call number (sys_exit)
   int 0x80            ;call kernel

