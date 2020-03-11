; 11/march/2020 10:45 
;   first operand(dest), second(source), source usually no change
;   Register addressing: r_, _r, r_r
;   Immediate addressing: r_#val
;   Direct memory addressing: r_data
;   Direct-offset addressing: r_data[3], r_data + 2
;   Indirect memory addressing: [r]_123
;
;

section	.data
    name db 'con meo'
    val  db 88
section	.text
   global _start     ;must be declared for linker (ld)

_start:             ;tell linker entry point
   mov	edx,1     ;message length
   mov	ecx,val   ;message to write
   add  ecx,0x30
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	edx,9       ;message length
   mov	ecx, name   ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	[name],  dword 'meo'    ; Changed the name to Nuha Ali
	
   mov	edx,8       ;message length
   mov	ecx,name    ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel
