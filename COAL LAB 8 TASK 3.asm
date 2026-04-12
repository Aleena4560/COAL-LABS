.model small
.stack 100h
.data
newline db 0dh,0ah,'$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov bl, 'A'     

print_loop:
    mov dl, bl      
    mov ah, 02h
    int 21h

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    inc bl
    cmp bl, 'Z'
    jle print_loop

    mov ah, 4ch
    int 21h
end main
