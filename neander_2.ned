;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Result (179d) = 5*Y-4*X
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NOP

LDA input1
ADD input1
ADD input1
ADD input1
STA input1X4
LDA input2
ADD input2
ADD input2
ADD input2
ADD input2
STA input2X5
SUB input1X4
STA result2
HLT

ORG 128 		; Variaveis 2
input1:		DB 10
input2:		DB 20
input1X4:	DB 0
input2X5:	DB 0
result2: 	DB 0