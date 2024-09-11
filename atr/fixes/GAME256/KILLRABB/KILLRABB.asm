
	icl "..\..\asm\Fixes.asm"
	m_enable_basic
	
	opt h-
	ins 'KILLRABB-Original.xex',+2
	
	opt h+
	run $80
