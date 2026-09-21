.ORIG x3000

; Set R3 to 0
AND R3, R3, #0

; R1 is the loop counter, starting at 0
AND R1, R1, #0

; Load maximum number of iterations
LD R2, MAX

LOOP
; Check if counter equals maximum
NOT R4, R2
ADD R4, R4, #1
ADD R4, R1, R4
BRz DONE

; Add 5 to R3
ADD R3, R3, #5

; Increase counter by 1
ADD R1, R1, #1

BR LOOP

DONE
; Store R3 at x8001
LD R5, RESULTADDR
STR R3, R5, #0

HALT

MAX .FILL #4
RESULTADDR .FILL x8001

.END