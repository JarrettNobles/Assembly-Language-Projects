; Jarrett Nobles
; P9
; 12/5/2022

%macro PrintIt 2
  pusha
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h
  popa
%endmacro





SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
nums: dw 200,300,0,65535,300,100
numslen: EQU($-nums)

OriArray: dw "Originl Array", 10
OriArraylen: EQU ($-OriArray)

SortArray: dw "Sorted Array", 10
SortArraylen: EQU ($-SortArray)

outputfield: db "     ", 10
SECTION .bss

cls: db 1bh, '[2j'
clsSize: EQU $-cls
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.
PrintIt cls, clsSize
PrintIt OriArray, OriArraylen
mov ecx, numslen/2
mov ebx, nums
call printTop
mov ecx, numslen
mov ebx, nums
call bubblesort
PrintIt newline, 1
PrintIt SortArray, SortArraylen
mov ecx, numslen/2
mov ebx, nums
call printTop

lastBreak:


; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

Loop1:
  xor dx,dx
  div WORD[ten]
  add dl, '0'
  mov [ebx], dl
  dec ebx
  loop Loop1
PrintIt outputfield, 10
popa
ret

printArray: 
  mov ax, [ebx[]
  call aString
  add ebx, 2
  loop printTop
ret

bubbleSort:
  pusha
  shr ecx, 1
  start:
    xor eax, eax
    compare:
      mov dx, [ebx+ebx*2]
      cmp dx, [ebx+eax*2+2]
      jb noswap
      xchg dx, word[ebx+eax*2+2]
      mov word[ebx+eax*2], dx
      inc eax
      cmp eax, numslen/2-1
      jne compare
      loop start
    noswap:
      inc eax
      cmp eax, numslen/2-1
      jne compare
      loop start
popa
ret
