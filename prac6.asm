;Write an ALP that does the following
;(1) Display the string “Enter User Name” and goes to the next line
;(2) Takes in the user entered string compares with user name value already stored in memory
;(3) If there is no match it should exit.
;(4) If there is a match it should display the string “Enter Password” and goes to next line
;(5) Takes in password entered by the user and compares with password already stored in memory
;(6) If there is no match it should exit’
;(7) If there is a match it should display “Hello Username”
;Note:
;While the username is being entered it can be displayed but when password is being entered user
;pressed key should be displayed instead it should display “*” for every key pressed.
;The user name size is fixed to 10 characters and password to 8 characters.



.MODEL TINY
.386
.DATA 
  MSG1 DB 'ENTER THE USERNAME$'
  MSG2 DB  'ENTER PASSWORD$'
  MSG3 DB 'HELLO $'
  MSG4 DB 'INVALID LOGIN$'
  MAX1 DB 100
  ACT1 DB ?
  INP1 DB 100 DUP(?)
  MAX2 DB 100
  ACT2 DB ?
  INP2 DB 100 DUP(?)
  USERNAME DB 'NIANA$'
  PASSWORD DB '123456$'
.CODE
.STARTUP
  LEA DX,MSG1
  MOV AH,09H
  INT 21H
  MOV DL,0DH
  MOV AH,02H
  INT 21H
  MOV DL,0AH
  MOV AH,02H
  INT 21H
  LEA DX,MAX1
  MOV AH,0AH
  INT 21H
  LEA SI,USERNAME
  LEA DI,INP1
  CLD
  MOVZX CX,ACT1
  REPE CMPSB
  CMP CX,0H
  JNE X1
  LEA DX,MSG2
  MOV AH,09H
  INT 21H
  MOV DL,0DH
  MOV AH,02H
  INT 21H
  MOV DL,0AH
  MOV AH,02H
  INT 21H
  LEA DX,MAX2
  MOV AH,0AH
  INT 21H
  LEA SI,PASSWORD
  LEA DI,INP2
  CLD
  MOVZX CX,ACT2
  REPE CMPSB
  CMP CX,0H
  JNZ X1
  LEA DX,MSG3
  MOV AH,09H
  INT 21H
  MOV DL,0DH
  MOV AH,02H
  INT 21H
  MOV DL,0AH
  MOV AH,02H
  INT 21H
  
X1:
.EXIT
END 