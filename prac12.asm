;Write an ALP that will take in a single numerical input from the user (You can assume that the user will only enter numbers from 1-9). 
;This input must not be displayed
;on the screen. The user input is taken as an offset and fivecharacters in 
;the file m4.txt starting from the offset entered by the user is displayed on the screen.
;For e.g. if file m4.txt has 
;Any fool can criticize condemn and complain -and most fools do; since a fool is always wise in his eyes.
;and the user enters 5 The ALP should display‘fool ‘.You can assume that the file m4.txt is in the bin folder already–you need not create it.





.MODEL TINY
.386
.DATA
  FNAME DB 'm4.txt',0
  HANDLE DW ?
  OFFST DB ?
  STR1 DB 5 DUP(?),'$'
  
.CODE
.STARTUP
   MOV AH,08H
   INT 21H
   sub al,031h
   MOV OFFST,AL
   
   
   MOV AH,3DH
   MOV AL,0H
   LEA DX,FNAME
   INT 21H
   MOV HANDLE,AX
   
   
   MOV AH,42H
   MOV AL,1H
   MOV BX,HANDLE
   MOV DL,OFFST
   MOV DH,0H
   SUB CX,CX
   INT 21H
   
   MOV AH,3FH
   MOV BX,HANDLE
   MOV CX,05H
   LEA DX,STR1
   INT 21H
   
   MOV AH,3EH
   MOV BX,HANDLE
   INT 21H
  
   MOV AH,09H
   LEA DX,STR1
   INT 21H
.EXIT
END
   