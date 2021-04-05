;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1 .Soma de duas matrizes A e B 2x2 com dados de 8 bits
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NOP

LDA A
ADD B
STA C

LDA A+1
ADD B+1
STA C+1

LDA A+2
ADD B+2
STA C+2

LDA A+3
ADD B+3
STA C+3

HLT

ORG 128
; constants
Zero:    DB 0
Um:      DB 1
Dois:    DB 2
MenosUm: DB -1

A:	DAB 1,2,3,4
B:	DAB 3,3,3,3
C:	DAB [4]
