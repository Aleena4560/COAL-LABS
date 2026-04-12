.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC

    MOV AL, 2      ; Immediate value
    ADD AL, 5      ; Immediate value

    ADD AL, 48     ; Convert to ASCII

    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
