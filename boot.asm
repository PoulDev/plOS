[BITS 16]
[ORG 0x7C00]

%include "lib/stdlib.asm"
%include "lib/string.asm"
%include "lib/var.asm"

mov al, 'p'
call printchar
mov al, 'l'
call printchar
mov al, 'O'
call printchar
mov al, 'S'
call printchar     	

end:
jmp $
times 510-($-$$) db 0
db 0x55, 0xaa

