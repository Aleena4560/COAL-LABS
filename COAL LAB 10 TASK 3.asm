DATA SEGMENT
    ARR DB 1, 2, 3, 4, 5
    MSG DB 'Reversed Array: $'
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    MOV CX, 5
    MOV SI, 4 ; Start at the last index (5-1)
PRINT_REV:
    MOV DL, ARR[SI]
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    
    DEC SI
    LOOP PRINT_REV

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START




