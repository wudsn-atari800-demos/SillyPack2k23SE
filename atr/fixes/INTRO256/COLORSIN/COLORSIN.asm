 	icl "..\..\asm\Fixes.asm"
 
 	org $2000

	.proc clear
	lda #0
	tay
	ldx #7
loop	sta $2100,y
	sta (88),y
	iny
	bne loop
	inc loop+2
	dex
	bne loop
	rts
	.endp
	
	ini clear

	opt h-
	ins 'COLORSIN-Original.xex',+2
