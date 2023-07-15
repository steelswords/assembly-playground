.globl main
.extern printf

.section .text

_start:
main:
    push %rbx
    cmp %rdi, $2
    jne printUsage
    mov (%rsi), %rdi

    lea formatString(%rip), %rdi
    xor %rax, %rax # rax specifies the number of vector/variadic arguments.

    call printf
    pop %rbx

    ret
    movq $1, %rax
    xor %rbx, %rbx
    int $0x80 # Call exit(0)

printUsage:
    lea usageString(%rip), %rdi
    xor %rax, %rax
    call printf
    ret

# Naming it funky cause I don't want to accidentally call strlen() from the standard library.
myStrlen:

formatString:
    .asciz "%d\n"
usageString:
    .asciz "Usage: strlen \"string-to-count\"\n"
