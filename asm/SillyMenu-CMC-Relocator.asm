;
;	>>> SillyMenu by JAC! <<<
;
;	@com.wudsn.ide.lng.mainsourcefile=SillyMenu.asm
;	From https://github.com/tebe6502/Mad-Assembler/blob/master/examples/players/cmc_player_relocator/cmc_relocator.mac

/*
  CMC Relocator

  Offsets in the CMC file (after the DOS header):
  $0014..$0053	- LSB of pattern address
  $0054..$0093	- MSB of pattern address

  Example: cmc_relocator 'file.cmc' , new_address
*/

.macro	cmc_relocator

	.get :1					// Load the CMC file into the MADS buffer
	
	ift (.get[0] + .get[1]<<8) <> $FFFF
	 ert 'Bad file format'
	eif

new_add equ :2					// Get the new address for the CMC module

old_add	equ .get[2] + .get[3]<<8		// Get the old addressof the CMC module

	.def ?length = .get[4] + .get[5]<<8 - old_add + 1 // Length of the CMC file without the DOS header

	.put[2] = .lo(new_add)			// Correct the DOS header
	.put[3] = .hi(new_add)			// so it contains the information

	.put[4] = .lo(new_add + ?length - 1)	// about the new CMC module address
	.put[5] = .hi(new_add + ?length - 1)

ofs	equ 6

	.rept 64				// Loop over all 64 patterns

	?tmp = .get[ofs+$14+#] + .get[ofs+$54+#]<<8

	ift ?tmp < $FF00			// High byte $ff indicates unused pattern
	?hlp = ?tmp - old_add + new_add

	.put[ofs+$14+#] = .lo(?hlp)
	.put[ofs+$54+#] = .hi(?hlp)
	.else
	.put[ofs+$14+#] = $ff			// Normalize also the low byte to $ff
	.put[ofs+$54+#] = $ff
	eif

	.endr	

	.sav [6] ?length			// Save the relocated music into the current output file

.endm
