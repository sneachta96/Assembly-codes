;An n-character string is stored starting from memory location loc1. Write an ALP
;that will replace every mth character of the string with “(double quotes – ASCII
;equivalent for “ is 22H). The value of m can range between 5 to 9 and is stored in
;location off1. The values of n is between 10d to 120d and is stored in location cnt1.
;[The size n need not to be a multiple of m]




.MODEL TINY
.486
.DATA
   MSG1 DB 'ENTER THE STRING :',0DH,0AH,'$'
   OFF1 DB 5
   MAXCNT DB 20
   CNT1 DB ?
   LOC1 DB 20 DUP (?)
   LOC2 DB 20 DUP (?)
.CODE
.STARTUP
  LEA DX,MSG1
  MOV AH ,09H
  INT 21H
  
  LEA DX,MAXCNT
  MOV AH,0AH
  INT 21H
  
  LEA SI,LOC1
  LEA DI,LOC2
  MOVZX CX,CNT1
  
  MOV BH,22H
  MOV BL,1
  
X2 : LODSB 
     CMP BL,5
	 JNZ X1
	 MOV [DI],BH
	 INC DI
	 MOV BL,0
	 JMP X3
X1:  STOSB 
X3:  INC BL
     LOOP X2
	 
.EXIT
END