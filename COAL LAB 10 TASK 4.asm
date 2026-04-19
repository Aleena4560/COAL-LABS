DATA SEGMENT
    ARR DB 5 DUP(?)
    COUNT DB 0
    MSG1 DB 'Enter 5 numbers: $'
    MSG2 DB 0DH, 0AH, 'Total Even Count: $'
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV CX, 5
    MOV SI, 0
GET_INPUT:
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV ARR[SI], AL
    INC SI
    LOOP GET_INPUT

    MOV CX, 5
    MOV SI, 0
COUNT_EVEN:
    MOV AL, ARR[SI]
    TEST AL, 1    ; Bitwise AND with 1
    JNZ IS_ODD    ; If result is not zero, it's odd
    INC COUNT
IS_ODD:
    INC SI
    LOOP COUNT_EVEN

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    MOV DL, COUNT
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START