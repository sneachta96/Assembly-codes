;write  an  alp  that  will 
;take display  the 5th character  from the
;file  micro.txt  and display  it  as  shown below

;The Character Foreground is bright white and Background is always black and no blink. Use * 
;as the blocking function.


.MODEL TINY
.DATA 
  FILE DB 'micro.txt',0
  HANDLE DW  ?
  DAT1 DB ?
  CNT DB 05H
  
.CODE
.STARTUP
    LEA DX,FILE
	MOV AL,02H
	MOV AH,3DH
	INT 21H
	
	MOV HANDLE,AX
	MOV BX,HANDLE
	MOV AL,0
	MOV CX,0
	MOV DX,8
	MOV AH,42H
	INT 21H
	
	MOV BX,HANDLE
	LEA DX,DAT1
	MOV CX,1
	MOV AH,3FH
	INT 21H
	
	
	MOV AH,00
	MOV AL,03H
	INT 10H
	
	LEA SI,DAT1
	MOV AL,[SI]
    MOV DH,10
X1: MOV DL,10
	MOV BH,0
	MOV AH,02H
	INT 10H
	
	MOV AH,09H
	MOV BH,0
	MOV BL,00000111B
	MOV CX,5
	INT 10H
	
	INC DH
	CMP DH,14
	JNZ X1
	
	MOV AH,07H
X2: INT 21H
	CMP AL,'*'
	JNZ X2
	
	.EXIT
	END
