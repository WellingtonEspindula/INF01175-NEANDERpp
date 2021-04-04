;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Brief: 4 programs to testing NEANDER machine operations
;; Description: Programs to testing NEANDER machine:
;;	Program 1. realizes the sum of two matrices A and B
;;	Program 2. calculates the subtraction between five times A and four times B
;;	Program 3. given a number, verify if it's a pair (150d =  '1') or odd (150d =  '0')
;;	Program 4. Given the selection, (sel = 0) swaps A and B or (sel = 1) swaps the not A and not B
;;
;; Author: Wellington Machado de Espindula (wmespindula@inf.ufrgs.br)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NOP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1 .Soma de duas matrizes A e B 2x2 com dados de 8 bits
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prog_1:
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Result (179d) = 5*Y-4*X
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prog_2:
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Programa que calcule a paridade par de um número de 8 bits
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prog_3:
LDA x
XOR mascara_xor
AND mascara_and
STA paridade_x
HLT


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
STA a_4
JMP op_0

fim: 
HLT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ÁREA DE DADOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ORG 128 ; Diretiva do montador, que posiciona a montagem na pos. 128 da memória
; constants
Zero:    DB 0
Um:      DB 1
Dois:    DB 2
MenosUm: DB -1

ORG 133 		; Variaveis 1
A:	DAB 1,2,3,4
B:	DAB 3,3,3,3
C:	DAB [4]

ORG 152 		; Variaveis 2
input1:		DB 10
input2:		DB 20
input1X4:	DB 0
input2X5:	DB 0
result2: 	DB 0

ORG 147		; Variaveis 3
x:		DB 162
mascara_xor:	DB H01
mascara_and:	DB H01
ORG 150
paridade_x: 	DB 0

ORG 158 		; Variaveis 4
sel_4:		DB 1
a_4:		DB 33
b_4:		DB 92
xor_a_b:	DB 0
count_bits_1:	DB 0
