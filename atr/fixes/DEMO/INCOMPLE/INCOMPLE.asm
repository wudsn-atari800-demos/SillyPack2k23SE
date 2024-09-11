	icl "..\..\asm\Fixes.asm"
	m_force_coldstart
	
	opt h-
	ins 'INCOMPLE-Original.xex',+2
	
	opt h+
	org $680

start	lda #0
	tax
loop	sta $700,x
	inx
	bne loop
	inc loop+2
	ldy loop+2
	cpy #$20
	bne loop

	jmp $2ae8

	run start

