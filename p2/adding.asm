; Jarrett Nobles
; Project 2 Adding Integers
; 9/30/2022
; Etc...

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

mov AX, 0246h
mov BX, 0DCABh
add ax,bx

mov AX, 0ABCDh
mov BX, 0DCBAh 
add ax,bx

mov AX, 0FFFFh
mov BX, 0001h
add ax,bx

mov AX, 0F0F0h
mov BX, 0F0F0h 
add ax,bx

mov AX, 2468h
mov BX, 2468h
add ax,bx 

mov AX, 7FFFh
mov BX, 0001h
add ax,bx

mov AX, 0ABCDh
mov BX, 0FEDCh
add ax,bx

mov AX, 0B0Bh
mov BX, 0A11Eh
add ax,bx

mov AX, 7FFFh
mov BX, 7FFFh
add ax,bx

mov AX, 8000
mov BX, 8000
add ax,bx



; put your code here.
 


; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
