
.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "Name: Aleena Akhtar", 0DH, 0AH, "$"
    MSG2 DB "SAP ID: 69273", "$"

.CODE
MAIN PROC

    MOV AX, @DATA      ; Initialize Data Segment
    MOV DS, AX

    ; Print first message
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    ; Print second message
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN