section .text                               ; segmento text
global _start                               ; punto de entrada del ELF

_start:

    jmp short dummy                         ; 1. salto a un dummy con el call

imprimir_str:                               ; 3. syscall write()
    pop ecx                                 ; ecx => "you win Abraham!"
    mov al,4                                ; syscall write: $
    xor ebx,ebx                             ; ebx = 0
    inc ebx                                 ; stdoout filedescriptor: #1
    xor edx,edx                             ; edx = 0
    mov dl,17                               ; longitud de la cadena 
    int 0x80                                ; write (1, string, 17)

    mov al,1
    dec ebx
    int 0x80                                ; exit(0)

dummy: 
    call imprimir_str
    db 'you win Abraham!', 0x0b