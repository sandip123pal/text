section .data
section .text
global _start
_start:
mov rdi, 12
call ascii
;exit system call
mov rdx,60
mov rdi, 0
syscall
ascii:
mov rax, rdi
mov rax, ‘o’
ret
