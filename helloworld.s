.section .rodata             # read-only static data
.globl hello
hello:
  .string "Hello, world!!! demo hihi"    # zero-terminated C string

.text
.global main
main:
    push    %rbp
    mov     %rsp,  %rbp                 # create a stack frame 1

    mov     $hello, %edi                # put the address of hello into RDI 1
    call    puts                        #  as the first arg for puts

    mov     $0,    %eax                 # return value = 0.  Normally xor %eax,%eax
    leave                               # tear down the stack frame
    ret                            # pop the return address off the stack into RIP