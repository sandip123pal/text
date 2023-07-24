section .data
    num1 db 10       ; First integer (change the value as needed)
    num2 db 20       ; Second integer (change the value as needed)
    result db 0      ; Variable to store the result

section .text
    global _start    ; Entry point for the program

_start:
    ; Load the values of num1 and num2 into registers
    mov al, [num1]
    mov bl, [num2]

    ; Add the values in al and bl and store the result in al
    add al, bl

    ; Store the result in the 'result' variable
    mov [result], al

    ; Exit the program
    mov eax, 1       ; '1' is the exit syscall number
    xor ebx, ebx     ; '0' is the exit status
    int 0x80         ; Invoke the syscall to exit the program
