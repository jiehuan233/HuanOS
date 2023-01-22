org 0x800
jmp code



code:

;mov ax,1301h
;mov bx,000fh
;mov dx,0200h
;mov cx,1
;push ax
;mov ax,ds
;mov es,ax
;pop ax
;mov bp,tips
;int 10h

;ser cource
mov dx,0
mov bh,0
mov ah,0x2
int 0x10

push bx
jmp pk
kernel: db "HuanOS Rabbit Version",0
pk:
mov bx,kernel
call print
pop bx

mov ah,0x02
mov bh,0
mov dh,1
mov dl,0
int 0x10

mov ah,0x0e
mov al,'>'
int 0x10

stop:
mov ah,00h
int 16h
cmp al,13
je nl
cmp al,8
je backspace
mov ah,0x0e
int 10h
jmp stop
nl:
call newline
mov ah,0x0e
mov al,'>'
int 0x10
jmp stop
backspace:
mov ah,0x0e
int 10h
mov al,' '
int 10h
mov al,8
int 10h
jmp stop

;print \n
newline:
    push ax
    push bx
    mov AH,0xe
    mov al,0xd
    mov bh,0
    int 0x10
    mov AH,0xe
    mov al,0xa
    mov bh,0
    int 0x10
    pop bx
    pop ax
    ret
print:;bx=add
	push ax
	.pr:
	mov ah,0x0e
	cmp byte [bx],0
	je .endstring
	mov byte al,[bx]
	push bx
	mov bh,0
	int 0x10
	pop bx
	add bx,1
	jmp .pr
	.endstring:
	pop ax
	ret
