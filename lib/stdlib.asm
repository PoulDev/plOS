jmp EOF
print:
    pusha
.loop:
    mov AL, [SI]
    cmp AL, 0
    je .end
    call printchar
    inc SI
    jmp .loop
.end:
    popa
    ret

printchar:
    pusha
    mov AH, 0x0E
    mov BH, 0
    mov BL, 0x0F
    int 0x10
    popa
    ret

getkey:
    mov ah, 0x00
    int 0x16
    ret

clear:
    mov al, 02h
    mov ah, 00h
    int 0x10
    ret

newline:
    mov al, 0x0a
    call printchar
    mov al, 0x0d
    call printchar
    ret

reboot:
    int 0x19
    jmp start
    ret

getinput:
    mov ah, 0x00
    int 0x16
    cmp al, 0x0D
    je exitinput
    call printchar
    jmp getinput

exitinput:
    call newline
    ret

shutdown:
    mov ax, 5307h
    mov cx, 3
    mov bx, 1
    int 15h

EOF:
