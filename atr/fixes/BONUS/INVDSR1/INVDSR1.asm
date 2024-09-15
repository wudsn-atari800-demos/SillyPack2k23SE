 	icl "..\..\asm\Fixes.asm"
 	

zp = $ca	;Defined free ZP address space, 8 bytes required

	m_disable_basic

	org $8000	
 	m_load_high zp "INVDSR1-Original.xex"
 