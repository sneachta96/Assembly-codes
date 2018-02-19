/*
Write an ALP that will examine a set of 20 memory locations that have alphabets and count the number  of  vowels.  The  alphabets  are  store  from  memory  location alph1 and  the  count  of  the vowels must be stored in location vcnt.*/



.MODEL TINY
.486
.DATA
  ALPH1 DB  'a','e','p','A','c';
  VOWELS DB 'a','e','i','o','u', 'A','E','I','O','U'
  CNT DB 5
  VCNT DB 1 DUP(?)
.CODE
.STARTUP
   LEA SI,ALPH1
   MOV CL,CNT
X3:MOV AH,[SI] 
   MOV DX,10
   LEA DI,VOWELS
X1:MOV AL,[DI]
   CMP AL,AH
   JNZ X2
   INC BL
X2:INC DI
   DEC DX
   JNZ X1
   INC SI
   DEC CL
   JNZ X3
   MOV VCNT,BL

.EXIT
END

  
  
   
  