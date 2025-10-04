#
# Calculate sum from A to B.
#
# Authors: 
#	Andrew Choi
#

.text
main:
	# Put your sum S into register $t2
	addi $t0, $0, 1
	addi $t1, $0, 100
	addi $t2, $0, 0
loop:	
	add $t2, $t2, $t0
	beq $t0, $t1, end
	addi $t0, $t0, 1
	j loop
	
end:	
	j	end	# Infinite loop at the end of the program. 
