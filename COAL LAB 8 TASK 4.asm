
.model small
.stack 100h
.data
space db ' $'

.code
main:
    mov ax, @data
    mov ds, ax

    mov bl, '0'     

even_loop:
    mov dl, bl
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, space
    int 21h

    add bl, 2
    cmp bl, '8'
    jle even_loop

    mov ah, 4ch
    int 21h
end main



