.model small
.data
length db 6
width  db 4
msg db "Area of Rectangle with length 6 and width 4 = $"

.code
main proc

mov ax,@data
mov ds,ax

mov al,length
mov bl,width
mul bl          

mov bx,10
div bl          

mov cl,al       
mov ch,ah       

mov dx,offset msg
mov ah,9
int 21h

mov dl,cl
add dl,48
mov ah,2
int 21h

mov dl,ch
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
