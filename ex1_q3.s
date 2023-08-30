.data					#specifies that what follows are data with initial values
encoding:				#Decimal values of hexadecimal outputs from assignment table
	
	.word	163 		#$0 - A3
	.word	34		#$1 - 22
	.word	107		#$2 - 6B
	.word	13		#$3 - 0D
	.word	73		#$4 - 49
	.word	192		#$5 - C0
	.word	127		#$6 - 7F
	.word	184		#$7 - B8
	.word	49		#$8 - 31

.text					#specifies that what follows are instructions
.global main				#specifies that the label "main" is globally accessible

main:					#entry point into program
	
	la $5, encoding		#load address of 'encoding' array into $5
	
loop:
	jal readswitches		#loads switch values into $1		
	jal countOnSwitches		#jump to countOnSwitches label
	
	seqi $12, $13, 0		#stores 1 in $12 if $13 is equal to zero
	beqz $12, else			#if $12 is zero, branch to else
	lw $2, 0($5)			#load value from specific offset in 'encoding' array into $2
	jal writessd			#writes value stored in $2 onto SSD
	j loop				#jump back to beginning of loop

else:
	seqi $12, $13, 1
	beqz $12, else1
	lw $2, 1($5)
	jal writessd
	j loop

else1:
	seqi $12, $13, 2
	beqz $12, else2
	lw $2, 2($5)
	jal writessd
	j loop
	
else2:
	seqi $12, $13, 3
	beqz $12, else3
	lw $2, 3($5)
	jal writessd
	j loop
	
else3:
	seqi $12, $13, 4
	beqz $12, else4
	lw $2, 4($5)
	jal writessd
	j loop
	
else4:
	seqi $12, $13, 5
	beqz $12, else5
	lw $2, 5($5)
	jal writessd
	j loop

else5:
	seqi $12, $13, 6
	beqz $12, else6
	lw $2, 6($5)
	jal writessd
	j loop
	
else6:
	seqi $12, $13, 7
	beqz $12, else7
	lw $2, 7($5)
	jal writessd
	j loop

else7:
	lw $2, 8($5)
	jal writessd
	j loop

countOnSwitches:
	addi $13, $0, 0			#sets $13 register to zero (our count register)
	
	andi $3, $1, 1				#compares least significant bit of data and returns 1 or 0
	add $13, $13, $3			#adds 1 or 0 to count register
	srli $1, $1, 1				#shifts $1 right by 1
	
	andi $3, $1, 1
	add $13, $13, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $13, $13, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $13, $13, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $13, $13, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $13, $13, $3	
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $13, $13, $3
	srli $1, $1, 1
	
	andi $3, $1, 1
	add $13, $13, $3	
	srli $1, $1, 1
	
	jr $ra	
