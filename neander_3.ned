;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Programa que calcule a paridade par de um número de 8 bits
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NOP

LDA x
AND mascara_8
JZ masc7
LDA paridade_x
XOR Um
STA paridade_x

masc7:
LDA x
AND mascara_7
JZ masc6
LDA paridade_x
XOR Um
STA paridade_x

masc6:
LDA x
AND mascara_6
JZ masc5
LDA paridade_x
XOR Um
STA paridade_x

masc5:
LDA x
AND mascara_5
JZ masc4
LDA paridade_x
XOR Um
STA paridade_x

masc4:
LDA x
AND mascara_4
JZ masc3
LDA paridade_x
XOR Um
STA paridade_x

masc3:
LDA x
AND mascara_3
JZ masc2
LDA paridade_x
XOR Um
STA paridade_x

masc2:
LDA x
AND mascara_2
JZ masc1
LDA paridade_x
XOR Um
STA paridade_x

masc1:
LDA x
AND mascara_1
JZ fim_prog3
LDA paridade_x
XOR Um
STA paridade_x

fim_prog3:
HLT

ORG 128
Zero:    DB 0
Um:      DB 1
Dois:    DB 2
MenosUm: DB -1

x:		DB 162
mascara_8:	DB H80
mascara_7:	DB H40
mascara_6:	DB H20
mascara_5:	DB H10
mascara_4:	DB H08
mascara_3:	DB H04
mascara_2:	DB H02
mascara_1:	DB H01
ORG 150
paridade_x: 	DB 0
