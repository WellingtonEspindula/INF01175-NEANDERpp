;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. Programa que enquanto selecao (170d) for positiva.
;; 	Se selecao for:
;; 	0. Faz swapping de A (171d) e B (171d) e termina
;; 	1. Faz o swapping de NOT(A) e NOT (B) e termina
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prog_4:
LDA sel_4
JN fim
JZ op_0
SUB Um
JZ op_1
JMP prog_4

op_0:
LDA a_4
XOR b_4
STA xor_a_b
LDA xor_a_b
XOR b_4
STA b_4
LDA xor_a_b
XOR a_4
STA a_4
JMP fim


op_1:
LDA a_4 ; nega A
NOT
STA a_4
LDA b_4 ; nega B
NOT
STA b_4
JMP op_0

fim: 
HLT

ORG 128
; constants
Zero:    DB 0
Um:      DB 1
Dois:    DB 2
MenosUm: DB -1

sel_4:		DB 1
a_4:		DB 33
b_4:		DB 92
xor_a_b:	DB 0