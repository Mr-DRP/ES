		ORG 00H

		MOV TMOD,#03H ; TIMER 0 IN MODE 3 ;2
		
HERE:	MOV R2,#10H			;2
AGN:	MOV TL0,#5EH		;2
		SETB P1.5			;1
		ACALL DELAY			;2
		DJNZ R2,AGN			;2
		
		
		MOV R2,#40H			;2
AGN1:	MOV TL0,#5EH		;2
		CLR P1.5			;1
		ACALL DELAY			;2
		DJNZ R2,AGN1		;2
	
		SJMP HERE			;2
		
DELAY:	SETB TR0			;1
AGAIN:	JNB TF0, AGAIN		;161
		CLR TR0				;1
		CLR TF0				;1
		RET					;2
		

;HEX TO DEC CONVERTER
		MOV R0,#50H
		MOV A,R7
		MOV R6,A
		
AGN2:	MOV A,@R0
		MOV R4,#00H
		MOV B,#0AH
		DIV AB
		MOV R2,A
		SUBB A,#0AH
		JC SKIP
		MOV A,R2
		MOV R3,B
		MOV B,#0AH
		DIV AB
		MOV R4,A
		MOV A,B
		MOV B,R3
	;	MOV R2,A
SKIP:	MOV A,R2
		SWAP A
		ADD A,B
		MOV B,R4
		
		MOV @R0,A
		INC R0
		DJNZ R6,AGN2
	
;CHOOSE REQUIRED PATTERN
DISPLAY:MOVC A,@A+DPTR
		RET
			
;LED PATTERNS FOR NUMBERS 0-9
LABEL1:	DB 3FH
		DB 06H
		DB 5BH
		DB 4FH
		DB 66H
		DB 6DH
		DB 7DH
		DB 07H
		DB 7FH
		DB 6FH

		
		END