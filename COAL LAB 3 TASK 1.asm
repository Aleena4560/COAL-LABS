.model small
.stack 100H
.data
.code

main proc
    
    MOV AX, @DATA
    MOV DS, AX

    ; Print H
    MOV DL, 'H'
    MOV AH, 02H
    INT 21H

    ; Print E
    MOV DL, 'E'
    MOV AH, 02H
    INT 21H

    ; Print L
    MOV DL, 'L'
    MOV AH, 02H
    INT 21H

    ; Print L
    MOV DL, 'L'
    MOV AH, 02H
    INT 21H

    ; Print O
    MOV DL, 'O'
    MOV AH, 02H
    INT 21H

    ; Exit Program
    MOV AH, 4CH
    INT 21H

main endp
end main
