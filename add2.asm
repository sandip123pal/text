section .data
    hello db 'Hello, World!', 0    ; Null-terminated string to print

section .text
    global _start    ; Entry point for the program

_start:
    ; Function to print the string to the console
    ; int 0x80 is the 32-bit syscall instruction for Linux
    ; The syscall number for write is 4, and stdout file descriptor is 1
    ; 'hello' contains the address of the string to print
    ; The string length is 13 (including the null terminator)

    mov eax, 4        ; Syscall number for write
    mov ebx, 1        ; File descriptor 1 (stdout)
    mov ecx, hello    ; Address of the string to print
    mov edx, 13       ; Length of the string
    int 0x80          ; Invoke the syscall

    ; Exit the program
    mov eax, 1        ; Syscall number for exit
    xor ebx, ebx      ; Exit status 0
    int 0x80          ; Invoke the syscall to exit the program
