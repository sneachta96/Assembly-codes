
/*Consider a 
string stored from memory location labelled 
str1
the size of the string is stored in location 
cnt1
and will not exceed 300d. Write an ALP that will remove all the spaces in the string. 
[Note: The removal 
of spaces must be done in place 
–
you 
should not move the string to temporary location to perform this 
operation]
For e.g. if the string is “abcd efgh ijkl 1234”
After the ALP is executed the string should become “abcdefghijkl1234” */



.MODEL TINY
.486
.DATA
STR1 DB  "mirco proc cessor and inter facing"
CNT1 DW 100

.CODE
.STARTUP
     LEA SI,STR1
	 MOV DI,SI
	 MOV CX,CNT1
X1:  LODSB
     CMP AL,20H
	 JE  X2
	 STOSB
X2: LOOP X1
.EXIT
END	 
	 