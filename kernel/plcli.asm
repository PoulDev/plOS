jmp EOF2

startcli:

clrq:
    mov SI, curdir
    call print
    mov SI, plcliprefix
    call print
    call getinput
jmp clrq

EOF2: