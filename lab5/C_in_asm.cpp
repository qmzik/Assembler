#include <iostream> 

using namespace std; 

extern "C" void _bubbleSort() { 
const int size = 6; 
int a[size]; 

for (int i = 0; i < size; i++) { 
cout « "Enter " « i « " element of array" « endl; 
cin » a[i]; 
} 

int i, j; 
int tmp; 
for (i = 1; i < size; i++) { 
for (j = i; j > 0; j--) { 
if (a[j] < a[j - 1]) { 
tmp = a[j]; 
a[j] = a[j - 1]; 
a[j - 1] = tmp; 
} 
} 
} 

for (int i = 0; i < size; i++) { 
cout « a[i] « ' '; 
} 

} 

void main() 
{ 
_asm { 
call _bubbleSort 
} 
system("pause"); 
}