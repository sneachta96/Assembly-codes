.MODEL TINY
.DATA
   FILE DB 'micro.txt',0
   HANDLE DW ?
   DAT1 DB 4 DUP(?)
   
.CODE
.STARTUP
   LEA DX,FILE
   MOV AH,3DH
   MOV AL,0
   INT 21H
   
   MOV HANDLE,AX
   MOV BX,HANDLE
   MOV AH,03FH
   MOV CX,4
   LEA DX,DAT1
   INT 21H
   
   MOV BX,HANDLE
   MOV AH,03EH
   INT 21H
   
   MOV AH,0
   MOV AL,0
   INT 10H
   
   LEA SI,DAT1
   MOV AH,02H
   MOV DH,0
   MOV DL,0
   MOV BH,0
   INT 10H
   
   MOV AH,09H
   MOV AL,[SI]
   MOV BH,0
   MOV BL,10001001B
   MOV CX,1
   INT 10H
   
   INC SI
   
   MOV AH,02H
   MOV DH,0
   MOV DL,39
   MOV BH,0
   INT 10H
   
   MOV AH,09H
   MOV AL,[SI]
   MOV BH,0
   MOV BL,10001010B
   MOV CX,1
   INT 10H

   INC SI
   
   MOV AH,02H
   MOV DH,12
   MOV DL,0
   MOV BH,0
   INT 10H
   
   MOV AH,09H
   MOV AL,[SI]
   MOV BH,0
   MOV BL,10001100B
   MOV CX,1
   INT 10H
   
   INC SI
   
   MOV AH,02H
   MOV DH,12
   MOV DL,39
   MOV BH,0
   INT 10H
   
   MOV AH,09H
   MOV AL,[SI]
   MOV BH,0
   MOV BL,10001111B
   MOV CX,1
   INT 10H
   
   MOV AH,08H
X1:INT 21H
   CMP AL,'@'
   JNZ X1
   
   .EXIT
   END
   