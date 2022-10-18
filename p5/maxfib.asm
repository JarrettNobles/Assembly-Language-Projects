; JARRETT NOBLES
; Max Fibonacci
; 10/18/2022


SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here

MaxFib: RESD 1
FibCount: RESW 1

SECTION .text
global _main
_main:

; put your code here.
mov EAX, 0
mov EBX, 1
mov WORD[FibCount], 2
fibLoop:
    mov ECX,EAX   ; save a copy of the int
	add ECX,EBX     ; increment the int
	jc fibEnd   ; if there was not a carry, keep looping
	            ; otherwise BL has the max unsigned in	
	mov EAX,EBX
    mov EBX,ECX
    inc WORD [FibCount]
    jmp fibLoop
fibEnd:
    dec WORD [FibCount]
    mov [MaxFib], EAX

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
