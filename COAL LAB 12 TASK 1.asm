DATA SEGMENT
    ; No variables needed
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    MOV CX, 4       ; Outer loop: 4 rows
    MOV BL, 1       ; BL tracks how many digits to print per row

ROW_LOOP:
    PUSH CX         ; Save outer loop counter
    
    MOV CL, BL      ; Inner loop runs BL times
    MOV AL, '1'     ; Start each row with character '1'

PRINT_NUMBERS:
    MOV DL, AL      ; Move digit to DL for printing
    
    ; Save AL and CX because INT 21h can modify registers
    PUSH AX
    PUSH CX
    MOV AH, 02H     
    INT 21H
    POP CX
    POP AX
    
    INC AL          ; Move to next digit ('2', '3', etc.)
    LOOP PRINT_NUMBERS

    ; --- PRINT NEW LINE ---
    MOV DL, 0DH     ; Carriage Return (Move cursor to start of line)
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH     ; Line Feed (Move cursor to next line)
    MOV AH, 02H
    INT 21H
    ; ----------------------

    INC BL          ; Increase digit count for next row
    POP CX          ; Restore outer loop counter
    LOOP ROW_LOOP

    ; Terminate
    MOV AH, 4CH
    INT 21H
CODE ENDS
END START