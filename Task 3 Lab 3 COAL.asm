.model small
.stack 100H

.data
    NUM1 DB 7
    NUM2 DB 1

.code 

main proc

    MOV AX, @DATA
    MOV DS, AX

    MOV AL, NUM1   ; Direct addressing
    ADD AL, NUM2   ; Direct addressing

    ADD AL, 48     ; Convert to ASCII

    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H

main endp
end main
