

 /*Write an ALP that will take in a string of maximum 20 characters from user 
 and display it on the next line on the screen 
 (ASCII equivalent for newline is 0Dh (enter) followed by 0Ah (next line))
 */


.MODEL TINY
.386
.DATA
  STRING DB 'HELLO, HOW ARE YOU?$'

.CODE
.STARTUP
  LEA DX,STRING
  MOV AH,09H
  INT 21H
  MOV DL,0DH
  MOV AH,02H
  INT 21H
  MOV DL,0AH
  MOV AH,02H
  INT 21H
.EXIT
END