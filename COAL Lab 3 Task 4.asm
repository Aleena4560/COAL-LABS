.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 3
    NUM2 DB 6

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    LEA SI, NUM1   ; Load address into SI
    MOV AL, [SI]   ; Register indirect

    LEA DI, NUM2   ; Load address into DI
    ADD AL, [DI]   ; Register indirect

    ADD AL, 48     ; Convert to ASCII

    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
