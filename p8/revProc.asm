; NAME
; Assignment
; Date
; Etc...

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
SECTION .data
array1: dd      1,2,3,4,5
len1:   EQU     ($-array1)


array2: dd      -10, -9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9
len2:   EQU     ($-array2)


array3: dd  0,10,20,30,40,50,60,70,80,90
  dd  100,110,120,130,140,150,160,170,180,190
  dd  200,210,220,230,240,250,260,270,280,290
  dd  300,310,320,330,340,350,360,370,380,390
  dd  400,410,420,430,440,450,460,470,480,490,500
len3:   EQU     ($-array3)

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.
mov eax, 1
mov ebx, 2
mov ecx, 3
mov edx, 4
pusha
mov eax, 0
mov ebx, len1 - 4
reverseArray1:
  mov ecx, [array1 + eax]
  mov edx, [array1 + ebx]
  mov [array1 + ebx], ecx
  mov [array1 + eax], edx
  add eax, 4
  sub ebx, 4
  cmp eax, ebx
  jb reverseArray
  
mov eax, 0
mov ebx, len2 -4
reverseArray2:
  mov ecx, [array2 + eax]
  mov edx, [array2 + ebx]
  mov [array2 + ebx], ecx
  mov [array2 + eax], edx
  add eax, 4
  sub ebx, 4
  cmp eax, ebx
  jb reverseArray2
  
mov eax, 0
mov ebx, len3 -4
reverseArray3:
  mov ecx, [array3 + eax]
  mov edx, [array3 + ebx]
  mov [array3 + ebx], ecx
  mov [array3 + eax], edx
  add eax, 4
  sub ebx, 4
  cmp eax, ebx
  jb reverseArray3
printOnce:
printDone:

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
