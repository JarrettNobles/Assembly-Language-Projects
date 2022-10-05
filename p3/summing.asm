; Jarrett Nobles
; Project 3, summing arrays
; 10/5/2022
; This code sums all of the elements in each of the arrays and places the sum in a 
; corresponding sum variable. It also places the gradnTotal into a grandtotal variable.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
bArray: DB  -1,-2,-4,-5
wArray: DW  0,1,2,3,4
dArray: DD  322,322h,322q,1833,1833h
bArraySum:  DB  0
wArraySum:  DW  0
dArraySum:  DD  0
grandTotal: DD  0

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.
add BH,[bArray +1]
add BH,[bArray +2]
add BH,[bArray +3]
add BH,[bArray +4]
add BH,[bArray +5]
mov[bArraySum], BH
movsx eax BH

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
