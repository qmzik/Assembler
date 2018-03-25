%include "io.inc" 
%define _size 128 

section .bss 
input resb _size 
output resb _size * 2 
char resb 1 

section .text 
global CMAIN 
CMAIN: 
GET_STRING input, _size 
GET_CHAR char 
mov esi, input 
mov edi, output 

.checkString: 
call loadByte 
cmp al, 0 
je .printOutput 
cmp al, byte [char] 
jne .checkString 
call findNeighbors 
jmp .checkString 

.printOutput: 
PRINT_STRING output 
ret 

; то же самое что lodsb 
loadByte: 
mov al, byte [esi] 
inc esi 
ret 

; то же самое что stosb 
saveByte: 
mov byte [edi], al 
inc edi 
ret 

findNeighbors: 
times 2 push esi 
call getLeft 
pop esi 
call getRight 
pop esi 
ret 

getLeft: 
times 2 dec esi 
call loadByte 
cmp al, 0 
jne .end 
call getLast 

.end: 
call saveByte 
ret 

getRight: 
call loadByte 
cmp al, 0x0A ; сравниваем с \n 
je .getfirst 
cmp al, 0 
je .getfirst 
jmp .end 

.getfirst: 
call getFirst 

.end: 
call saveByte 
ret 

getLast: 
call loadByte 
cmp byte [esi], 0x0A ; сравниваем с \n 
je .end 
jmp getLast 

.end: 
ret 

getFirst: 
mov esi, input 
call loadByte 
ret