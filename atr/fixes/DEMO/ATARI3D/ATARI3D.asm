	icl "..\..\asm\Fixes.asm"


ram	= $680

	org $2000
start	jmp main

	.local demo
	ins "ATARI3D-Original-$800-$85d7.bin"
	.endl
	
	.proc main

	ldx #0
ram_loop
	lda copy_and_run_template,x
	sta ram,x
	inx
	cpx #.len copy_and_run
	bne ram_loop
	jmp ram
	.endp

copy_and_run_template
	.proc copy_and_run,ram
	mva #1 coldst

	ldy #>[.len demo+$ff]
	ldx #0
loop
from	lda demo,x
to	sta $800,x
	inx
	bne loop
	inc from+2
	inc to+2
	dey
	bne loop
	jmp $8551
	.endp
	
	run start
