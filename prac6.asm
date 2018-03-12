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
 TEXT1 DB 'ENTER USERNAME $'
 TEXT2 DB 'ENTER PASSWORD $'
 NEWLINE DB 0DH,0AH,'$'
 TEXT3 DB 'HELLO $'
 USERALLOWED DB 'JASMEET $'
 MAX1 DB 11
 ACT1 DB ?
 USERENTERED DB 11 DUP(?)
 PASSALLOWED DB '123456$'
 PASSENTERED DB 8 DUP(?)
 ACT2 DB ?
 TEXT4 DB 'TRY AGAIN $'
 
 .CODE
 .STARTUP
   LEA DX,TEXT1
   MOV AH,09H
   INT 21H
   
   LEA DX,NEWLINE
   MOV AH,09H
   INT 21H
   
   LEA DX,MAX1
   MOV AH,0AH
   INT 21H
   
   CLD
   LEA SI,USERALLOWED
   LEA DI,USERENTERED
   MOVZX CX,ACT1
   
   REPE CMPSB
   CMP CX,00H
   JE X1
   
   LEA DX,TEXT4
   MOV AH,09H
   INT 21H
   
   LEA DX,USERALLOWED
   MOV AH,09H
   INT 21H
   
   MOV AH,4CH
   INT 21H
   
X1: LEA DX,TEXT2
    MOV AH,09H
	INT 21H
	
	LEA DX,NEWLINE
	MOV AH,09H
	INT 21H
	
	LEA BX,PASSENTERED
	MOV DL,'*'
	MOVZX CX,ACT2
X3: 
    MOV AH,08H
	INT 21H
	MOV [BX],AL
	INC  BX
	CMP AL,'$'
	JZ X4
	
	
	MOV AH,02H
	INT 21H
	LOOP X3
	
X4:	CLD 
	LEA SI,PASSALLOWED
	LEA DI,PASSENTERED
	MOVZX CX,ACT2
	
	REPE CMPSB
	CMP CX,00H
	JE X2
	
	LEA DX,NEWLINE
	MOV AH,09H
	INT 21H
	
	LEA DX,TEXT4
	MOV AH,09H
	INT 21H
	
	MOV AH,4CH
	INT 21H
	
X2: LEA DX,NEWLINE
    MOV AH,09H
	INT 21H
	
	LEA DX,TEXT3
	MOV AH,09H
	INT 21H
	
.EXIT
END
