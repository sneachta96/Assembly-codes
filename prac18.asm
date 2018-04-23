.MODEL TINY
.DATA
   FILE DB 'micro.txt',0
   HANDLE DW ?
   DAT1 DB 24 DUP(?)
   CNT DB 24
   PREV DB ?
.CODE
.STARTUP

   LEA DX,FILE
   MOV AH,3DH
   MOV AL,0
   INT 21H
   MOV HANDLE,AX
   
   MOV BX,HANDLE
   MOV AH,03FH
   MOV CX,24
   LEA DX,DAT1
   INT 21H
   
   MOV AH,3EH
   MOV BX,HANDLE
   INT 21H
   
   LEA SI,DAT1
   MOV AH,0FH
   INT 10H
   MOV PREV,AL
   
   MOV AH,0
   MOV AL,0
   INT 10H
   
   MOV DX,0
X1:MOV BH ,0
   MOV AH,02H
   INT 10H
   
   MOV AH,09H
   MOV AL,[SI]
   MOV BH,0
   MOV BL,00001011B
   MOV CX,1
   INT 10H
   INC DH
   INC DL
   DEC CNT
   INC SI
   CMP CNT,0
   JNZ X1
   
   MOV AH,08H
X3:INT 21H
   CMP AL,'@'
   JNZ X3
   
   MOV AL,PREV
   MOV AH,0
   INT 10H
   
   .EXIT
   END