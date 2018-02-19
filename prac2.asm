/* Write an ALP that will copy 
a set of 10 bytes from memory location 
loc1 to memory location loc2 in the reverse order.*/

.MODEL TINY
.386
.DATA 
   LOC1 DB 1,2,3,4,5,6,7,8,9,0
   LOC2 DB 10 DUP(?)
.CODE
.STARTUP
   LEA SI,LOC1+9
   LEA DI,LOC2
   MOV CX,10
X1:MOV AL,[SI]
   MOV [DI],AL
   INC DI
   DEC SI
   DEC CX
   JNZ X1
.EXIT
END
   