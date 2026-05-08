.model small
.stack 100h
.data

.code
main:
    mov ax, @data
    mov ds, ax

    mov bl, 1        ; row

row_loop:
    cmp bl, 6
    je exit

    mov cl, 1        ; column

col_loop:
    mov al, bl
    mul cl           ; AX = row * column

    ; -------- FIXED PRINT --------
    cmp al, 10
    jb one_digit

    ; two digit number
    mov ah, 0        ; ? CLEAR AH BEFORE DIV
    mov dl, 10
    div dl           ; AL = tens, AH = ones

    ; print tens
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; print ones
    mov dl, ah
    add dl, 30h
    mov ah, 02h
    int 21h
    jmp space

one_digit:
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

space:
    mov dl, ' '
    mov ah, 02h
    int 21h

    inc cl
    cmp cl, 6
    jne col_loop

    ; new line
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    int 21h

    inc bl
    jmp row_loop

exit:
    mov ah, 4Ch
    int 21h

end main




