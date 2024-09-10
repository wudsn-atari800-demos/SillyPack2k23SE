
	opt h+
 	org $ca
start	mva #1 580
	jsr $2000
 	jmp $1000

 	opt h-
 	ins 'INVDSR2-Original.xex',+0,$32c6+6
 	
 	opt h+
 	run start
  