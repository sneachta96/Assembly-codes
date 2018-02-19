/*Consider a 
32
-
bit array stored in memory 
–
labelled as 
array1. 
The size of array1 is stored in location 
cnt1
. 
Write an ALP that will 
convert only the negative numbers in the array into big endian
format.
The positive 
numbers should not be affected. 
You can assume that cnt1 will not exceed 
500. */

.MODEL TINY
.486
.DATA 
   ARRAY1 DD 12345678H,45656778H,98989898H,87878787H
   CNT1 DW 500

.CODE
.STARTUP
   LEA SI,ARRAY1
   MOV CX,CNT1
X1:MOV EAX,[SI]
   CMP EAX,0
   JAE X2
   BSWAP EAX
   MOV [SI],EAX
X2: ADD SI,4
    DEC CX
	JNZ X1
.EXIT
END