; JARRETT NOBLES
; P6 Matrx Manipulation
; 11/4/2022
; Etc...

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ


SECTION .bss
; define uninitialized data here
RowSums: RESW ROWS
ColSums: RESW COLS
Sum: RESW 1

SECTION .text
global _main
_main:

; put your code here.


lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h




