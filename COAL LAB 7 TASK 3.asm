.model small
.data
msg1 db "Quotient for 66 divided by 7 = $"
msg2 db 13,10,"Remainder for 66 divided by 7 = $"

.code
main proc

mov ax,@data
mov ds,ax

mov ax,66
mov bl,7
div bl          

mov cl,al
mov ch,ah

mov dx,offset msg1
mov ah,9
int 21h

mov dl,cl
add dl,48
mov ah,2
int 21h

mov dx,offset msg2
mov ah,9
int 21h

mov dl,ch
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main