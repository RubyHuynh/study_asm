; 26march, 28march
; and, or, xor (1 if differnet both), not: change first operant
; jmp, jz,
; test: not change operant (how)?
; call & ret: kaka
; aware of the fall through, out of frame crash
 
%assign toto    1
%assign titi    2
section .bss
   res resw 4  

section .text
   global _start             
	
_start:           
   mov   ax, toto           
   add   ax, '0'
   mov   [res], ax
   call print_nb

   mov ax, toto
   and   ax, 1              
   jz    evnn     
   call __odd
   call   trigger_or
   jmp outprog
   
__odd:

   mov   eax, 4              
   mov   ebx, 1              
   mov   ecx, odd_msg        
   mov   edx, len2           
   int   0x80           
   ret

print_nb:
   mov   eax, 4              
   mov   ebx, 1              
   mov   ecx, res        
   mov   edx, 4           
   int   0x80                
   ret

trigger_or:
    mov ax, toto
    mov bx, titi
    or ax, bx
    add ax, '0'
    mov [res], ax
    call print_nb
    sub ax, '0'
    test ax, 01h
    call __evn
    ret

outprog:
   mov   eax,1               
   int   0x80                

__evn:

   mov   eax, 4              
   mov   ebx, 1              
   mov   ecx, even_msg       
   mov   edx, len1           
   int   0x80     
   ret 
evnn:     
    call __evn        
   call trigger_or
   jmp outprog

section   .data
even_msg  db  ' is Even Number!'  
len1  equ  $ - even_msg 
   
odd_msg db  ' is Odd Number!'     
len2  equ  $ - odd_msg