[BITS 16]
[ORG 0x7C00]

jmp EOF
printchar:
    mov ah, 0x0e
    int 0x10
    ret
input:
    mov ah, 0x00
    int 0x16
    call printchar
    jmp input
    ret
newline:
    mov al, 0x0a 
    call printchar
    mov al, 0x0d
    call printchar
    ret
clear:
    mov al, 02h
    mov ah, 00h
    int 0x10
    ret
EOF: