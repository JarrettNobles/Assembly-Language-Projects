; JARRETT NOBLES
; P4 FIBONACCI SEQUENCE
; 10/12/2022
; Etc...

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here
Fibs: RESW 16
Sum:  RESW 1
SECTION .text
global _main
_main:

; put your code here.
MOV WORD[Fibs], 0
MOV WORD[Fibs+2],1

MOV AX, [Fibs]
ADD AX,[Fibs+2]
MOV [Fibs+4],AX

MOV AX, [Fibs+2]
ADD AX,[Fibs+4]
MOV [Fibs+6],AX

MOV AX, [Fibs+4]
ADD AX,[Fibs+6]
MOV [Fibs+8],AX

MOV AX, [Fibs+6]
ADD AX,[Fibs+8]
MOV [Fibs+10],AX

MOV AX, [Fibs+8]
ADD AX,[Fibs+10]
MOV [Fibs+12],AX

MOV AX, [Fibs+10]
ADD AX,[Fibs+12]
MOV [Fibs+14],AX

MOV AX, [Fibs+12]
ADD AX,[Fibs+14]
MOV [Fibs+16],AX

MOV AX, [Fibs+14]
ADD AX,[Fibs+16]
MOV [Fibs+18],AX

MOV AX, [Fibs+16]
ADD AX,[Fibs+18]
MOV [Fibs+20],AX

MOV AX, [Fibs+18]
ADD AX,[Fibs+20]
MOV [Fibs+24],AX

MOV AX, [Fibs+20]
ADD AX,[Fibs+24]
MOV [Fibs+26],AX

MOV AX, [Fibs+24]
ADD AX,[Fibs+26]
MOV [Fibs+28],AX

MOV AX, [Fibs+26]
ADD AX,[Fibs+28]
MOV [Fibs+30],AX

lastBreak:







; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
