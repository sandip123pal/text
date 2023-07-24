section .bss
    fib resb 100      ; Buffer to store the Fibonacci sequence
    n resd 1          ; Input for the nth Fibonacci number

section .text
    global _start     ; Entry point for the program

_start:
    ; Ask user for the value of n (nth Fibonacci number)
    mov eax, 4        ; Syscall number for write
    mov ebx, 1        ; File descriptor 1 (stdout)
    lea ecx, [prompt] ; Load the address of the prompt string
    mov edx, prompt_len ; Length of the prompt string
    int 0x80          ; Invoke the syscall to print the prompt

    ; Read the user input (n) from the console
    mov eax, 3        ; Syscall number for read
    mov ebx, 0        ; File descriptor 0 (stdin)
    lea ecx, [n]      ; Load the address of the 'n' variable
    mov edx, 4        ; Number of bytes to read (32-bit integer)
    int 0x80          ; Invoke the syscall to read the input

    ; Convert ASCII input to an integer (atoi function)
    mov ebx, 10       ; Base 10 for conversion
    xor ecx, ecx      ; Clear ECX for summing
    xor edx, edx      ; Clear EDX for multiplication
atoi_loop:
    movzx eax, byte [n + ecx] ; Load the next character from the input
    test eax, eax     ; Check for the null terminator (end of input)
    jz atoi_done      ; If null terminator, we're done
    sub eax, '0'      ; Convert ASCII digit to integer
    imul edx, edx, ebx      ; Multiply the result by 10 (EDX * 10)
    add edx, eax      ; Add the new digit to the result
    inc ecx           ; Move to the next character
    jmp atoi_loop
atoi_done:

    ; Calculate and print the Fibonacci sequence
    mov eax, 0        ; First Fibonacci number
    mov ebx, 1        ; Second Fibonacci number
    mov [fib], eax    ; Store the first number in the buffer
    add ecx, 1        ; Add 1 to the input (n) to get the number of Fibonacci numbers to generate
    lea edi, [fib + 4] ; EDI points to the next empty slot in the buffer

fib_loop:
    mov edx, eax     ; Save the current Fibonacci number in EDX
    add eax, ebx     ; Calculate the next Fibonacci number (sum of previous two)
    mov [edi], eax   ; Store the new number in the buffer
    mov ebx, edx     ; Update ebx to the previous Fibonacci number
    add edi, 4       ; Move the destination pointer to the next slot in the buffer
    loop fib_loop

    ; Print the Fibonacci sequence
    mov eax, 4       ; Syscall number for write
    mov ebx, 1       ; File descriptor 1 (stdout)
    lea ecx, [fib]   ; Load the address of the Fibonacci buffer
    mov edx, ecx     ; Move the number of bytes to print (same as the number of bytes in the buffer)
    sub edx, edi     ; Calculate the number of bytes used in the buffer
    sub edx, 4       ; Subtract 4 bytes for the last element (which is one extra iteration)
    imul edx, edx, 4 ; Convert to the number of bytes to print
    int 0x80         ; Invoke the syscall to print the Fibonacci sequence

    ; Exit the program
    mov eax, 1       ; Syscall number for exit
    xor ebx, ebx     ; Exit status 0
    int 0x80         ; Invoke the syscall to exit the program

section .data
    prompt db 'Enter the value of n: ', 0    ; Null-terminated string for user prompt
    prompt_len equ $ - prompt                ; Length of the prompt string (excluding null terminator)
