DATA SEGMENT
    ARR DB 5 DUP(?)
    MSG1 DB 'Enter 5 numbers: $'
    MSG2 DB 0DH, 0AH, 'Sum is: $'
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
INPUT:
    MOV AH, 01H
    INT 21H
    SUB AL, 30H ; Convert ASCII to digit
    MOV ARR[SI], AL
    INC SI
    LOOP INPUT

    MOV CX, 5
    MOV SI, 0
    MOV BL, 0
SUM_LOOP:
    ADD BL, ARR[SI]
    INC SI
    LOOP SUM_LOOP

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    MOV AL, BL
    ADD AL, 30H ; Convert back to ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START