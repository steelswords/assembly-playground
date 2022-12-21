.globl main
.extern printf

.section .text

_start:
main:
    # The ABI spcecifies the number of arguments, the arguments vector's address,
    # and the environment variables' vector's address being on the stack in a
    # specified format.
    # However, because the linker inserts some support code that sets things up
    # here, it utilizes the standard calling convention to make `main` actually
    # get passed arguments, just as it would be written in C:
    # `int main(int argc, char **argv)`.
    push %rbx
    mov %rdi, %rsi
    lea formatString(%rip), %rdi
    xor %rax, %rax # rax specifies the number of vector/variadic arguments.

    call printf
    pop %rbx

    ret
    movq $1, %rax
    xor %rbx, %rbx
    int $0x80 # Call exit(0)

formatString:
    .asciz "%d\n"
