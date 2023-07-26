section .bss
    n resb 1

section .text
    global _start

_start:
    ; mov rax, 83
    mov rax, 83

    ; sub rax, 48
    sub rax, 48

    ; add rax, '0'
    add rax, '0'

    ; mov [n], rax
    mov byte [n], al

    ; mov rdi, n
    mov rdi, n

    ; mov rsi, n
    mov rsi, n

    ; mov rdx, 1
    mov rdx, 1

    ; mov rax, 1
    mov rax, 1

    ; syscall
    syscall

    ; mov rax, 60 ; syscall number for exit
    mov rax, 60

    ; xor rdi, rdi ; exit status 0
    xor rdi, rdi

    ; syscall
    syscall
