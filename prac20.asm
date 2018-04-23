.MODEL TINY
.DATA
.CODE

   CNT DB 25
  
.STARTUP
  mov  AH,00
  MOV AL,03H
  INT 10H
  
  MOV DH,0
X2:MOV DL,0
   MOV BH,0
   MOV AH,02H
   INT 10H
   
   MOV AH,09H
   MOV AL,20H
   MOV BH,0
   MOV CX,40
   MOV BL, 01000000B
   INT 10H
   
   MOV DL,40
   MOV BH,0
   MOV AH,02H
   INT 10H
   
   MOV AH,09H
   MOV AL,20H
   MOV BH,0
   MOV CX,40
   MOV BL,00110000B
   INT 10H
   
   INC DH
   CMP DH,CNT
   JNZ X2
   
   MOV AH,08H
 X1:INT 21H
   CMP AL,'@'
   JNZ X1
   
   .EXIT
   END
    