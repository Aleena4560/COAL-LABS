.model small
.data
num db 3
msg db "Cube of 3 = $"

.code
main proc

mov ax,@data
mov ds,ax

mov al,num
mov bl,num
mul bl        

mov bl,num
mul bl        

mov bl,10
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




