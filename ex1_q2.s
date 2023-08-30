.text
.global main

main:
	j loop
	
loop:
	jal readswitches		#loads switch values into $1
	addi $2, $0, 0			#sets $2 register to zero (our count register)
	jal countOnSwitches		#jump to countOnSwitches label

	jal writessd			#display count on ssd
	
	j main
	
	
countOnSwitches:
	andi $3, $1, 1			#compares least significant bit of data and returns 1 or 0
	add $2, $2, $3			#adds 1 or 0 to count register
	srli $1, $1, 1			#shifts $1 right by 1
	
	andi $3, $1, 1
	add $2, $2, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $2, $2, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $2, $2, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $2, $2, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $2, $2, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $2, $2, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $2, $2, $3	
	srli $1, $1, 1
	
	jr $ra

	

	

