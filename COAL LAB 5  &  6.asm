                                      .model small
.stack 100h

.data
NameMsg  DB 'Full Name: Aleena Akhtar$'
SapMsg   DB 'SAP ID: 69273$'
BatchMsg DB 'Batch: Spring 2026$'
ProgMsg  DB 'Program and Semester: BSSE 3rd Semester$'

.code
main proc

mov ax, @data
mov ds, ax

; Print Full Name
mov dx, offset NameMsg
mov ah, 9
int 21h

; New Line
mov dl, 13
mov ah, 2
int 21h
mov dl, 10
mov ah, 2
int 21h

; Print SAP ID
mov dx, offset SapMsg
mov ah, 9
int 21h

; New Line
mov dl, 13
mov ah, 2
int 21h
mov dl, 10
mov ah, 2
int 21h

; Print Batch
mov dx, offset BatchMsg
mov ah, 9
int 21h

; New Line
mov dl, 13
mov ah, 2
int 21h
mov dl, 10
mov ah, 2
int 21h

; Print Program + Semester
mov dx, offset ProgMsg
mov ah, 9
int 21h

; Exit
mov ah, 4Ch
int 21h

main endp
end main