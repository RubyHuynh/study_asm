;    31	32	33	34H
;    AAA − ASCII Adjust After Addition
;    AAS − ASCII Adjust After Subtraction
;    AAM − ASCII Adjust After Multiplication
;    AAD − ASCII Adjust Before Division

;    Unpacked BCD representation 01	02	03	04H
;    Packed BCD representation 12	34H 
;           DAA − Decimal Adjust After Addition
;           DAS − decimal Adjust After Subtraction


section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   sub     ah, ah
   mov     al, '9'
   sub     al, '3'
   aas
   or      al, 30h
   mov     [res], ax
	
   mov	edx,len	        ;message length
   mov	ecx,msg	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	
   mov	edx,1	        ;message length
   mov	ecx,res	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	



   mov     esi, 4       ;pointing to the rightmost digit
   mov     ecx, 5       ;num of digits
   clc
add_loop:  
   mov 	al, [num1 + esi]
   adc 	al, [num2 + esi]
   aaa
   pushf
   or 	al, 30h
   popf
	
   mov	[sum + esi], al
   dec	esi
   loop	add_loop
	
   mov	edx,len1	        ;message length
   mov	ecx,msg1	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	
   mov	edx,5	        ;message length
   mov	ecx,sum	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel
	
   mov	eax,1	        ;system call number (sys_exit)
   int	0x80	        ;call kernel


   mov	eax,1	        ;system call number (sys_exit)
   int	0x80	        ;call kernel
	



section	.data
msg db 'The Result is:',0xa	
len equ $ - msg		
msg1 db 'The Sum is:',0xa	
len1 equ $ - msg1			
num1 db '2'
num2 db '4'
sum db '     '

section .bss
res resb 1  
