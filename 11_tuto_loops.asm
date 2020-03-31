;; 31 march 2020, 12:33pm 
;ECX register contains the loop count.
;When the loop instruction is executed, the ECX register is decremented and the control jumps to the target label,
; until the ECX register value, i.e., the counter reaches the value zero.

section	.text
   global _start         
	
_start:	        
   mov ecx,12
   mov eax, '1'
	
l1:
   mov [num], eax
   mov eax, 4
   mov ebx, 1
   push ecx
	
   mov ecx, num        
   mov edx, 1        
   int 0x80
	
   mov eax, [num]
   sub eax, '0'
   inc eax
   add eax, '0'
   pop ecx
   loop l1
	
   mov eax,1              
   int 0x80               
section	.bss
    num resb 1