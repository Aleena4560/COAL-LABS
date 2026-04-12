.model small
.stack 100h

.data
str db 'MADAM$',0

equal db ' = $'
pal_msg db 'Palindrome$'
not_msg db 'Not Palindrome$'

.code
main proc
    mov ax,@data
    mov ds,ax

    ; ---- PRINT STRING ----
    mov dx,offset str
    mov ah,9
    int 21h

    ; ---- PRINT " = " ----
    mov dx,offset equal
    mov ah,9
    int 21h

    lea si,str
    xor cx,cx

; ---- PUSH ALL CHARACTERS ----
push_loop:
    mov al,[si]
    cmp al,'$'
    je start_check

    mov ah,0        ; clear AH
    push ax
    inc si
    inc cx
    jmp push_loop

; ---- CHECK PALINDROME ----
start_check:
    lea si,str

check_loop:
    cmp cx,0
    je is_palindrome

    mov al,[si]
    pop bx
    cmp al,bl
    jne not_palindrome

    inc si
    dec cx
    jmp check_loop

; ---- OUTPUT ----
is_palindrome:
    mov dx,offset pal_msg
    mov ah,9
    int 21h
    jmp exit

not_palindrome:
    mov dx,offset not_msg
    mov ah,9
    int 21h

exit:
    mov ah,4ch
    int 21h

main endp
end main