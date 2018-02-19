
/*Write a program that will convert a 32 bit data stored in little endian format to bigendian format.Redo this for any array using the previous code you have written as Subprogram and Macro*/
/*USING SUBPROGRAM*/
.MODEL TINY
.486
.DATA
  VAL1 DD 12345667H
.CODE
.STARTUP
  LEA SI,VAL1
  CALL SWAP
.EXIT

SWAP PROC NEAR
      MOV EAX,[SI]
	  BSWAP EAX
	  MOV [SI],EAX
	  RET
SWAP  ENDP
END
--------------------------------------------------------------------------------------------
/*USING MARCO*/
.MODEL TINY
.486
.DATA
  VAL1 DD 12345667H
  SWAP MACRO A
        MOV EAX,A
		BSWAP EAX
		MOV A,EAX
		ENDM
.CODE
.STARTUP
   SWAP VAL1
.EXIT
END