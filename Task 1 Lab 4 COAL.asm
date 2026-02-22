
.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 25H        ; First 8-bit number (37 decimal)
    NUM2 DB 13H        ; Second 8-bit number (19 decimal)
    RESULT DB ?        ; To store the sum

.CODE
MAIN PROC

    MOV AX, @DATA      ; Initialize data segment
    MOV DS, AX

    MOV AL, NUM1       ; Load first number into AL
    ADD AL, NUM2       ; Add second number to AL
    MOV RESULT, AL     ; Store result in RESULT

    MOV AH, 4CH        ; Exit program
    INT 21H

MAIN ENDP
END MAIN