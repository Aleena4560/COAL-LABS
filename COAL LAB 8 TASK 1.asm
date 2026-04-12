.model small
.stack 100h
.data
.code
main:
    mov ax, @data
    mov ds, ax

    mov dl, '9'     

reverse_loop:
    mov ah, 02h
    int 21h         

    dec dl          ; go backwards
    cmp dl, '0' - 1
    jne reverse_loop

    mov ah, 4ch
    int 21h
end main



