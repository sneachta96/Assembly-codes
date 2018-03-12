
;Write an ALP that takes in a single user key input 
;(you can assume that user will enter only values 
;between 1 and 9) and displays as many ‘$’ as the 
;numeric value entered by the user. The key that
;the user presses must not be displayed onscreen.
;For e.g. if user enters 4 then $$$$ must be displayed on screen.







.MODEL TINY
.386
.DATA
.CODE
.STARTUP
  MOV AH,08H
  INT 21H
  SUB AL,30H   ;THIS HAS BEEN DONE AS VALUE WOULD BE AS ASCII
  MOVZX CX,AL
  MOV DL,'$'

X1: MOV AH,02H
    INT 21H
	LOOP X1
.EXIT
END