org 0x7c00

section code

;mov ah,0x6
;mov al,0
;mov cx,0
;mov dx,0xffff
;int 0x10
;clear screen
mov ah,0x00
mov al,0x03
int 0x10

;ser cource
mov dx,0
mov bh,0
mov ah,0x2
int 0x10

;print h
    mov AH,0xe
    mov al,'h'
    mov bh,0
    int 0x10
    mov al,'u'
    int 0x10
    mov al,'a'
    int 0x10
    mov al,'n'
    int 0x10

call newline

mov ah,0x02
mov al,1
mov ch,0
mov cl,2
mov dh,0
mov dl,0x80
mov bx,0x800
int 0x13
jnc ok

error:
    mov AH,0xe
    mov al,'e'
    mov bh,0
    int 0x10
    jmp ok

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

ok:
jmp 0x800
times 510 - ($-$$) db 0
dw 0xaa55