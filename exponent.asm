.ORIG x3000

; Load x and y
LD R0, X
LD R1, Y

; R2 will store the final answer
AND R2, R2, #0
ADD R2, R2, #1

; Check if y is 0
ADD R1, R1, #0
BRz DONE

; R3 is the exponent counter
AND R3, R3, #0

POWERLOOP
; R4 will hold multiplication result
AND R4, R4, #0

; R5 is multiplication counter
AND R5, R5, #0
ADD R5, R5, R0

MULTLOOP
ADD R4, R4, R2
ADD R5, R5, #-1
BRp MULTLOOP

; Move multiplication result into R2
AND R2, R2, #0
ADD R2, R2, R4

; Increase exponent counter
ADD R3, R3, #1

; Check if counter equals y
NOT R6, R1
ADD R6, R6, #1
ADD R6, R3, R6
BRn POWERLOOP

DONE
; Store result at x8000
LD R7, RESULTADDR
STR R2, R7, #0

HALT

X .FILL #2
Y .FILL #3
RESULTADDR .FILL x8000

.END