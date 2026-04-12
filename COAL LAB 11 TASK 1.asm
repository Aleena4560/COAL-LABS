
.model small
.stack 100h
.data
str db 'AUSTRALIA$',0   ; string ends with $
msg db 10,13,'Total characters in word Australia are= $'

.code
main proc
    mov ax,@data
    mov ds,ax

    lea si,str
    xor cx,cx        ; CX = 0 (counter)

count_loop:
    mov al,[si]
    cmp al,'$'
    je done_count

    push ax          ; push character
    inc cx           ; increment counter
    inc si
    jmp count_loop

done_count:
    ; print message
    mov dx,offset msg
    mov ah,9
    int 21h

    ; convert number in CX to ASCII (single digit only)
    mov dl,cl
    add dl,'0'
    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
main endp
end main