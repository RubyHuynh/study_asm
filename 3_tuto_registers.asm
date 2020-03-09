; 10/3/2020 3a.m Processor registers:
;     Generals registers:
;        Pointer register: EIP, ESP, EBP
;               IP (Instructor pointer), SP (Stack pointer), BP (Base pointer)
;               SP:SS == current stack, BP:SS == parameter location
;        Index registers: ESI, EDI
;               SI (source), DI (dest) in string operations
;        Data registers: EAX, EBX, ECX, EDX
;               EAX (primary accumulation), EBX (base/indexed addressing), 
;               ECX (count/storing counter in interative op), EDX (saving input/output)
;     Controls registers: intruction pointer + flags
;        Flag bit:
;               OF (11, overflowed/leftmost high-order bit), DF (10, direction in string operations, 0 == ltr, 1 == rtl)
;               IF (9, external interrupt, 0 == ignored), TF (8, set trap for debugging)
;               SF (7, sign), ZF (6, zero), AF (4, auxilliary carry from bit3-4), PF (2, parity, number of 1-bits), CF (0, carry leftmost)
;     Segments registers:
;        Code segment: CS (start address of the intruction)
;        Data segment: DS
;        Stack segments: SS (data and returned address)   


section .data
    msg db 'Stars printer', 0xa
    len equ $ - msg
    s2 times 9 db '*'
    
section .text
    global _start

_start:
    mov edx,len     ; input
    mov ecx,msg     ; counter 
    mov ebx,1       ; base, stdout
    mov eax,4       ; op, write
    int 0x80        ; call
    ; finished printing msg :D

    mov edx,9       
    mov ecx,s2      
    mov ebx,1
    mov eax,4
    int 0x80
    
    mov	eax,1 ; exit
    int 0x80
