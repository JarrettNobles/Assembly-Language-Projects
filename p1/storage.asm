; NAME	Jarrett Nobles
; Assignment	Program 1: Data Storage
; Date	9/20/2022
; Etc...

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
a1: 	DW 	2,4,6,8,10
a2: 	DB 	1,2,3,4,5
a3:	DD	10,20,30,40
a4:	DQ	10h,11h,12h,13h

b1:	DW	-50
b2:	DB	-45
b3:	DW	-30
b4:	DB	-25
b5:	DW	-20

c1:	DB	'Bears'
c2:	DD	100
c3:	DW	0
c4:	DB	'Go ;'
c5:	DB	'Mercer!'

d1:	DB	100
d2:	DW	100h
d3:	DD	100b
d4:	DW	100q
d5:	DB	100d
SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.



; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

