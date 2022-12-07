.globl main
.extern printf

.section .text

main:
    # Needed to adhere to the System V ABI. More explanation to come.
    push %rbx
    # You might be tempted to simply mov the address of string into %rdi, but this
    # requires the executable to be a PIE (Position Independent Executable), which
    # it takes some tricks to make gcc and ld happy about. But by using lea, we
    # get something that Just Works(TM) with gcc.
    #mov $welcomeMessage, %rdx
    lea welcomeMessage(%rip), %rdi

    # Printf expects the number of vector arguments to be in al, so clear al
    xor %eax, %eax

    call printf
    pop %rbx

exit_cleanly:
    ret
    movq $1, %rax
    movq $0, %rbx
    int $0x80 # Syscall. This one calls exit(0)

.section .data
welcomeMessage:
    .asciz "Hello, world!\n"




