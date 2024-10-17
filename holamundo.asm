section .data                   ; segmento DATA
mensaje db "Hola mundo", 0x0a

section .text                   ; segmento text
global _start                   ; punto de entrada del ELF

_start:

;syscall write(1, mensaje, 11)
    mov eax, 4                   ; syscall write: #4
    mov ebx, 1                   ; stdout filedescriptor: #1
    mov ecx, mensaje             ; mensaje en ecx
    mov edx, 11                  ; longitud del mensaje
    int 0x80                     ; interrupcion

;syscall exit(0)
    mov eax, 1
    mov ebx, 0
    int 0x80