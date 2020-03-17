; 17/march/2020 22:45 Allocating Storage Space for Initialized Data (data)
;   DB (define byte, 1 byte), DW (define word, 2 bytes)
;   DD (define doubleword, 4 bytes), DQ (define quadword, 8 bytes), DT (define tenword, 10 bytes)
;   [variable-name]    define-directive    initial-value   [,initial-value]...
;   Muti-init: TIMES
;       marks  TIMES  9  DW  0
; Allocating Storage Space for Uninitialized Data (BSS)
;   RESB (reserve byte, 1 byte), RESW (reserve word, 2 bytes)
;   RESD (reserve doubleword, 4 bytes), RESQ (reserve quadword, 8 bytes), REST (reserve tenword, 10 bytes)
;   [variable-name]    define-directive    initial-value   [,initial-value]...
; - Each byte of character is stored as its ASCII value in hexadecimal.
; - Each decimal value is automatically converted to its 16-bit binary equivalent and stored as a hexadecimal number.
; - Processor uses the little-endian byte ordering.
; - Negative numbers are converted to its 2's complement representation. 

section	.data
    stars   times 9 db '*'

section	.text
   global _start        ;must be declared for linker (ld)
	
_start:                 ;tell linker entry point
   mov	edx,9		;message length
   mov	ecx, stars	;message to write
   mov	ebx,1		;file descriptor (stdout)
   mov	eax,4		;system call number (sys_write)
   int	0x80		;call kernel

   mov	eax,1		;system call number (sys_exit)
   int	0x80		;call kernel
