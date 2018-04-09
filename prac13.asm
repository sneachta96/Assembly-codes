;Display ‘DOLL’ 
;blinking in the center of the screen with White letters on Black background with 
;screen  resolution  at  720X400  pixels  in  text  VGA  mode  (80colsX25rows)  with  16  colours.(cursor 
;needs to be advanced with each character. Use video mode 3

.MODEL TINY
.DATA
   STRING DB "DOLL"
   COUNT DB 04H
.CODE
.STARTUP
    ;SETTING THE DISPLAY MODE
	MOV AL,3
	MOV AH,0
	INT 10H
	
	LEA SI,STRING
	MOV DL,40     ;INITIAL SETTING OF THE COLUMN
	
X1: MOV AH,2   ;SETTING THE CURSOR POSITION
    MOV BH,0   ; THE PAGE NUMBER , USUALLY ZERO
	MOV DH,12   ; SETTING THE ROW
	INT 10H
	
	MOV AL,[SI]
	MOV AH,09H
	MOV BH,0
	MOV CX,1 
	MOV BL, 8FH
	INT 10H
	
	
	INC DL  
	INC SI
	DEC COUNT
	JNZ X1
	
	MOV AH,7
X2:	INT 21H
	CMP AL,'%'
	JNZ X2
	
	.EXIT
	END