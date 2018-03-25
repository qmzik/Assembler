%include "io.inc" 
%define _size 64 
%include "F:\Programming\asm\lol.mac"


section .bss 
input resb _size 
output resb _size 
char resb 1 

section .text 
global CMAIN 
CMAIN:

GET_STRING input, _size 
GET_CHAR char
mov esi, input
mov edi, output

myfunc: lol char, output

ret