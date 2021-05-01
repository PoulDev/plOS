BITS 16
ORG 0x7c00

xor ax, ax
mov ds, ax
mov bx, 0x7c00
cli
mov ss, ax
mov sp, bx
sti

%include "lib/stdlib.asm"
%include "kernel/plcli.asm"

jmp start
rbbt: call reboot

start:


call clear

mov si, welcomemsg
call print
call newline
call newline
mov si, plclimsg
call print
call newline
mov si, videosettingsmsg
call print
call newline
mov si, shutdownmsg
call print
call newline

retry:
call getkey

cmp al, "1"
je plcli
cmp al, "2"
je videosettings
cmp al, "3"
je shutdownoptions
jmp retry
    

plcli:
    call clear
    jmp startcli

videosettings:
    call clear
    mov si, video640x480msg
    call print
    call newline
    mov si, video1024x768msg
    call print
    call newline
    mov si, backmsg
    call print
    call newline

    call getkey

    cmp al, "1"
    je set640x480
    cmp al, "2"
    je set1024x768
    cmp al, "3"
    je start
    jmp videosettings

shutdownoptions:
    call clear
    mov si, shutdownoptionsmsg
    call print
    call newline
    call newline
    mov si, shtdwmsg
    call print
    call newline
    mov si, rebootmsg
    call print
    call newline
    mov si, backmsg
    call print
    call newline
    call getkey
    cmp al, "1"
    je shutdown
    cmp al, "2"
    je rbbt
    cmp al, "3"
    je start
    jmp shutdownoptions

set640x480:
    mov ah, 0x00
    mov al, 0x101
    int 0x10
    jmp videosettings
set1024x768:
    mov ah, 0x00
    mov al, 0x105
    int 0x10
    jmp videosettings


welcomemsg db "plOS",0
plclimsg db "1) PL-CLI",0
shutdownmsg db "3) Shutdown options",0
settingsmsg db "3) Settings",0
loadguimsg db "4) Load GUI Interface"
shutdownoptionsmsg db "Shutdown options",0
rebootmsg db "2) Reboot",0
plcliprefix db "@PL-CLI$ ",0
backmsg db "3) Back",0
helpcommand db "help",0
shtdwmsg db "1) Shutdown",0
videosettingsmsg db "2) Video settings",0
video640x480msg db "1) Set 640x480 as display size"
video1024x768msg db "2) Set 1024x768 as display size"


curdir db "/root/"

jmp $
times 528-($-$$) db 0
db 0x55, 0xaa