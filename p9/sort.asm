; Jarrett Nobles
; P9
; 12/5/2022
SECTION .data
;;Initializing Array / length
nums:	    dw	 200, 300, 0, 65535, 0, 1, 65534, 300, 100
numslen:	EQU	($-nums)

;;Newline value
newLine:  db 10

;;Printing out Header
s1: DB "Original Array",10, 0
lenS1: EQU ($ - s1)

;;Printing out Header
s2: DB "Sorted Array",10, 10
lenS2: EQU ($ - s2)

;;Clear Screen
cls:    db 1bh, "[2J"

;;Output field to hold converted number
outputfield: db ""


SECTION .bss

SECTION .text
global _main
_main:

call clear_screen	;;Clear Screen
call print_fheader	;;Print First Header			
;;must be in bytes	;;Parameters for convertToString Function
push numslen / 2	;;Divide by two to find size of array
push nums		;;Push array
call convertToString	;;Call Convert Function
			;;Parameters for Sorting Function
push numslen / 2	
push nums
call sortInAscending	;;Call Sort Function
call print_sheader	;;Printing Second Header
			;;Passing Parameters for convertToString function
push numslen / 2		
push nums
call convertToString	;;Call for Sorting Function	

;;Last BreakPoint
lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

;;Printing Macro - 2 parameters
%macro print 2
  pusha
  mov eax, 4     ; syswrite
  mov ebx, 1     ; stdout
  mov ecx, %1    ; starting address of string
  mov edx, %2    ; len of string
  int 80h
  popa
%endmacro

;;Sorting Function for Ascending Order
;;-- parameters passed by pushing array and its length
sortInAscending: 
  push ebp
  mov ebp, esp
  push ebx
  mov edx, 0
  mov esi, [ebp + 8]
  mov ecx, [ebp + 12]		;;last attribute in the array
  dec ecx
  mov edx, 0

outer: 				;;outer loop continues size of array
  push ecx
  inner:			;;continues
    mov ax, word[esi+edx]
    mov bx, word[esi+edx+2]	
    cmp ax, bx			;;Comparing
    ja swapValues		;;Jump swap if greater
    jmp getNextValue			
    swapValues:			;;swap digits
      xchg ax, bx		;;swapping registers
      mov word[esi+edx], ax	;;setting array attributes
      mov word[esi+edx+2], bx	;;setting array attributes
    getNextValue:
      add edx, 2		;;adding two for next value
  loop inner			;;loops back to inner 
  pop ecx
  mov edx, 0
loop outer
pop ebx
pop ebp
ret ;;exit Sorting Function 

;;Function for converting the digits in the array to have leading 0's
;;--parameter passed by pushing - array and length of array
convertToString: 
  push ebp
  mov ebp, esp
  push ebx
  mov esi, [ebp+8]		;;array pointers
  mov ecx, [ebp+12]       	;;array pointers
  right:			;;start loop
    xor eax, eax		;;starting with first digit from right
    xor dx, dx			;;Clearing
    mov ax, word[esi]    	;;first element
    mov bx,  10		    	;;dividing element by ax
    div bx			
    add dx, '0'
    mov	byte[outputfield+4], dl ;;set location in array
    				;;continues for all other 4 places
    xor dx, dx               
    div bx
    add dx, '0'
    mov byte[outputfield+3], dl
    
    xor dx, dx
    div bx
    add dx, '0'
    mov byte[outputfield+2], dl
    
    xor dx, dx
    div bx
    add dx, '0'
    mov byte[outputfield+1], dl
    
    xor dx, dx
    div bx
    add dx, '0'
    mov byte[outputfield], dl
    
    mov byte[outputfield+5], 20h	;;adding space between each group of digits
    print outputfield, 6		;;printing element
    add esi, 2				;;add to offset
loop right   
pop ebx
pop ebp
ret ;;End of function 

;;Print First Header
print_fheader:
  pusha
  mov eax, 4     ; syswrite
  mov ebx, 1     ; stdout
  mov ecx, s1    ; starting address of string
  mov edx, lenS1 ; len of string
  int 80h
  popa
ret

;;Print Second Header Function 
print_sheader:
  pusha
  mov eax, 4     ; syswrite
  mov ebx, 1     ; stdout
  mov ecx, s2    ; starting address of string
  mov edx, lenS2 ; len of string
  int 80h
  popa
ret

;;Clear Screen Function
clear_screen:
  pusha
  mov     eax,4
  mov     ebx,1
  mov     ecx,cls
  mov     edx,4
  int     80h
  popa
ret

new_line:
  pusha
  mov     eax,4
  mov     ebx,1
  mov     ecx, newLine
  mov     edx,4
  int     80h
  popa
ret


