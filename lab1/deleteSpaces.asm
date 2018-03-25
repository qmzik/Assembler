%include "io.inc" 
%define size 32 

section .bss 
input resb _size 
output resb _size 

section .text 
global CMAIN 
CMAIN: 
GET_STRING input, size 
mov esi, input 
mov edi, output 
cld 

.loop: 
lodsb 
cmp al, 0 
je .exit 
cmp al, " " 
je .loop 
stosb 
jmp .loop 

.exit: 
PRINT_STRING output 
ret