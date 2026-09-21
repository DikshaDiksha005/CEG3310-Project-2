.ORIG x3000

; R1 points to the beginning of the array
LEA R1, ARRAY

; R2 is the loop counter
AND R2, R2, #0

; R3 contains the array size
LD R3, SIZE

LOOP
; Display prompt
LEA R0, PROMPT
PUTS

; Get one character from user
GETC

; Convert ASCII digit to number
LD R4, ASCII
ADD R0, R0, R4

; Store number in current array location
STR R0, R1, #0

; Move to next array location
ADD R1, R1, #1

; Increase loop counter
ADD R2, R2, #1

; Check if counter equals array size
NOT R5, R3
ADD R5, R5, #1
ADD R5, R2, R5
BRn LOOP

HALT

SIZE .FILL #5
ASCII .FILL xFFD0
PROMPT .STRINGZ "Enter a number 0 to 9: "
ARRAY .BLKW #5

.END