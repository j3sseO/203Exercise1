.text
.global main

main:

	j loop			#jump to loop label
	
loop:
	jal readswitches	#jumps to readswitches subroutine
				#readswitches - reads the current value represented
				#by switches into register $1
				
	add $2, $0, $1 	#moves contents of $1 to $2
	
	jal writessd		#jumps to writessd subroutine
				#writes the lowest 8 bits of register $2 to the
				#seven segment displays, shown as hexadecimal digits
				
	j loop			#jumps back to loop label (starts loop again)
	

