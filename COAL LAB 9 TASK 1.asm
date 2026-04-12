.model small
.stack 100h

.data
char db 'A'

.code
main proc

    mov ax, @data
    mov ds, ax

    mov cx, 5        ; counter = 5

start_loop:
    mov dl, char     ; load 'A' into DL
    mov ah, 02h      ; DOS interrupt to print character
    int 21h

    dec cx           ; decrease counter
    jnz start_loop   ; jump back if CX != 0

    ; exit program
    mov ah, 4Ch
    int 21h

main endp
end main



