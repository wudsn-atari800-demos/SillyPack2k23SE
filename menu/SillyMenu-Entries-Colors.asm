;
;	>>> SillyMenu by JAC! <<<
;
;	@com.wudsn.ide.lng.mainsourcefile=..\asm\SillyMenu.asm
;
;	Lengths specifies the number of line with same color.
;	Length 0 terminates the sequence.
;	Chromas specify the PAL color values with luma zero.

;              LO, LO, BO, GR, AS, MU, G2, GA, I2, DE, WI, TI.
lengths	.byte  13,  7 , 8, 10,  8,  9,  7, 16,  8,  8, 10, 9, 0
chromas	.byte $30,$10,$e0,$d0,$b0,$90,$70,$50,$40,$20,$f0,$c0,$00,$00
;chroma .byte $30,$10,$e0,$d0,$b0,$90,$70,$50,$40,$20,$f0,$c0,$a0,$00

