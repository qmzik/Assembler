#include <iostream> 
#define SIZE 22 
using namespace std; 

extern "C" void* setString() 
{ 
cout « "Enter the string (up to 20 characters):" « endl; 

char* str = new char[SIZE]; 
std::cin.getline(str, 82, '\n'); 

if (strlen(str) > SIZE) 
{ 
cout « "Your string contains to many symbols" « endl; 
system("pause"); 
exit(1); 
} 

return str; 
} 

extern "C" char setSymbol() 
{ 
cout « "Enter the symbol:" « endl; 

char symbol; 

cin » symbol; 

return symbol; 
} 

extern "C" void line_search(char *str, char symbol) { 
int enters = 0; 
for (int i = 0; i < SIZE; i++) 
{ 
if (str[i] == symbol) 
enters++; 
} 

cout « enters « " enters" « endl; 
} 

void main() 
{ 
_asm { 
call setString 
mov esi, eax 
call setSymbol 

push eax 
push esi 
call line_search 
pop esi 
pop eax 
} 
system("pause"); 
}