; 10/03/2020 3:58 am, all syscalls: /usr/include/asm/unistd.h
;   Put the system call number in the EAX register.
;   Store the arguments to the system call in the registers EBX, ECX, EDX, ESI, EDI, and EBP.
;   Call the relevant interrupt (80h).
;   The result is usually returned in the EAX register.
;
;
;

section .data                           ;Data segment
   userMsg db 'Please enter a number: ' ;Ask the user to enter a number
   lenUserMsg equ $-userMsg             ;The length of the message
   dispMsg db 'You have entered: '
   lenDispMsg equ $-dispMsg                 

section .bss           ;Uninitialized data
   num resb 5
	
section .text          ;Code Segment
   global _start
	
_start:                ;User prompt
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   ;Read and store the user input
   mov eax, 3
   mov ebx, 2       ; stdin
   mov ecx, num     ; save into num
   mov edx, 6          ;size of num, 5 bytes (numeric, 1 for sign) of that information
   int 80h
	
   ;Output the message 'The entered number is: '
   mov eax, 4
   mov ebx, 1
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h  

   ;Output the number entered
   mov eax, 4
   mov ebx, 1
   mov ecx, num
   mov edx, 5
   int 80h  
    
   ; Exit code
   mov eax, 1
   mov ebx, 1
   int 80h