.model small
.stack 100h
.data
.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5       

print_star:
    mov dl, '*'
    mov ah, 02h
    int 21h

    loop print_star

    mov ah, 4ch
    int 21h
end main