/*Consider a 
32-bit array stored in memory–labelled as array1. The size of array1 is stored in location cnt1. Write an ALP that will 
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

/*The following approach is using STRING instructions..*/
.MODEL TINY
.486
.DATA
  STR1 DD 12345678H,45656778H,98989898H,87878787H
  CNT1 DW 4

.CODE
.STARTUP
    LEA SI,STR1
	MOV DI,SI
    MOV CX,CNT1
X1: LODSD 
    CMP EAX,0
	JAE X2
	BSWAP EAX
X2: STOSD
    LOOP X1
.EXIT
END


/* This is without using BSWAP */
.model tiny
.486
.data                                                                                        
array1	dd		0FEFFEEFFH,12345678H, 87654321H,87654321H,456789ABH, 12345678H
cnt1	dw		06h
.code
.startup
		lea		di,array1
		mov		cx,cnt1
x1:		mov		eax,[di]
		mov		ebx,eax
		rol		ebx,1
		jnc		x2
		mov		ebx,eax
		rol		ebx,16
		rol		bx,8
		rol		ax,8
		rol		eax,16
		and		eax,0ffff0000h
		and		ebx,0ffffh
		or		eax,ebx
x2:		stosd
		loop	x1
.exit
end
