; JARRETT NOBLES
; P6 Matrx Manipulation
; 11/4/2022
; Etc...

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
ROWS: EQU 5
COLS: EQU 7
MyMatrix: dw	 1,  2,  3,  4,  5,  6,  7
	  dw	 8,  9, 10, 11, 12, 13, 14
	  dw	15, 16, 17, 18, 19, 20, 21
	  dw	22, 23, 24, 25, 26, 27, 28
	  dw	29, 30, 31, 32, 33, 34, 35
SECTION .bss
; define uninitialized data here
RowSums: RESW ROWS
ColSums: RESW COLS
Sum: RESW 1
saveECX: RESD 1
colCount: RESD 1

SECTION .text
global _main
_main:

; put your code here.
mov edx, 0
mov ebx, 0

mov ecx ROWS

  outerloop:
    mov dword [saveECX], ecx
    mov ax, 0
    mov ecx, COLS
    innerloop:
      add ax, [MyMatrix + edx]
      add edx, 2
    loop inner1
    mov ecx, [saveECX]
    mov word[RowSums + ebx], ax
    add ebx, 2
  loop outer1
  
  nextRows:
  xor ecx, ecx
mov edx, 0
mov ebx, 0

mov dword [colCount], 0
mov ecx, COLS
outer2:
   mov dword [saveECX], ecx
   mov ax, 0
   mov ecx, ROWS                         

   inner2:
     add ax, [MyMatrix + edx]
     add edx, COLS*2
   loop inner2

   add dword [colCount], 2
   mov edx, [colCount]                   
   mov ecx, [saveECX]
   mov word[ColSums + ebx], ax
   add ebx, 2

loop outer2

colsDone:

  xor ecx, ecx
  mov edx, 0
  mov ax, 0
  mov ecx, ROWS
  sumUp:
    add ax, [RowSums + edx]
    add edx, 2
  loop sumUp
  mov word[Sum], ax

	

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h




