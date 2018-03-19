;Code to create a new file called 'file1.txt'


.MODEL TINY
.386
.DATA
   FNAME DB 'FILE1.txt',0
   HANDLE DW ?
.CODE
.STARTUP
   MOV AH,3CH
   LEA DX,FNAME
   INT 21H
   MOV HANDLE,AX
   MOV AH,3EH
   MOV BX,HANDLE
   INT 21H
.EXIT
END