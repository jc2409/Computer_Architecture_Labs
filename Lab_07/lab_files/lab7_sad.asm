#
# Sum of Absolute Differences Algorithm
#
# Authors: 
#	Andrew Choi
#

.text


main:


# Initializing data in memory... 
# Store in $s0 the address of the first element in memory
	# lui sets the upper 16 bits of thte specified register
	# ori the lower ones
	# (to be precise, lui also sets the lower 16 bits to 0, ori ORs it with the given immediate)
	     lui     $s0, 0x0000 # Address of first element in the vector
	     ori     $s0, 0x0000
	     addi   $t0, $0, 5	# left_image[0]	
	     sw      $t0, 0($s0)
	     addi   $t0, $0, 16	# left_image[1]		
	     sw      $t0, 4($s0)
	     # TODO1: initilize the rest of the memory.
	     addi $t0, $0, 7 # left_image[2]
	     sw $t0, 8($s0)
	     addi $t0, $0, 1 # left_image[3]
	     sw $t0, 12($s0)
	     addi $t0, $0, 1 # left_image[4]
	     sw $t0, 16($s0)
	     addi $t0, $0, 13 # left_image[5]
	     sw $t0, 20($s0)
	     addi $t0, $0, 2 # left_image[6]
	     sw $t0, 24($s0)
	     addi $t0, $0, 8 # left_image[7]
	     sw $t0, 28($s0)
	     addi $t0, $0, 10 # left_image[8]
	     sw $t0, 32($s0)	     
	     
	     addi $t0, $0, 4 # right_image[0]	
	     sw $t0, 36($s0)
	     addi $t0, $0, 15 # right_image[1]		
	     sw $t0, 40($s0)
	     addi $t0, $0, 8 # right_image[2]
	     sw $t0, 44($s0)
	     addi $t0, $0, 0 # right_image[3]
	     sw $t0, 48($s0)
	     addi $t0, $0, 2 # right_image[4]
	     sw $t0, 52($s0)
	     addi $t0, $0, 12 # right_image[5]
	     sw $t0, 56($s0)
	     addi $t0, $0, 3 # right_image[6]
	     sw $t0, 60($s0)
	     addi $t0, $0, 7 # right_image[7]
	     sw $t0, 64($s0)
	     addi $t0, $0, 11 # right_image[8]
	     sw $t0, 68($s0)	     
	     
	# TODO4: Loop over the elements of left_image and right_image
	
	addi $s1, $0, 0 # $s1 = i = 0
	addi $s2, $0, 9	# $s2 = image_size = 9
	
loop:

	# Check if we have traverse all the elements 
	# of the loop. If so, jump to end_loop:
	
	beq $s1, $s2, end_loop
	
	
	# Load left_image{i} and put the value in the corresponding register
	# before doing the function call
	mulu $t1, $s1, 4
	add $t2, $s0, $t1
	lw $t0, 0($t2)	
	
	
	# Load right_image{i} and put the value in the corresponding register
	
	add $t3, $0, 36
	add $t3, $t3, $t1
	add $t3, $s0, $t3
	lw $t4, 0($t3)
	
	# Call abs_diff
	add $a0, $0, $t4
	add $a1, $0, $t0
	jal abs_diff

	
	#Store the returned value in sad_array[i]
	addi $t0, $0, 72
	add $t2, $t0, $t1
	add $t2, $t2, $s0
	sw $v0, 0($t2)
	
	
	# Increment variable i and repeat loop:
	
	addi $s1, $s1, 1
	j loop
	

	
end_loop:

	#TODO5: Call recursive_sum and store the result in $t2
	#Calculate the base address of sad_array (first argument
	#of the function call)and store in the corresponding register   
	
	addi $a0, $s0, 72
	
	# Prepare the second argument of the function call: the size of the array
	mulu $t0, $s2, 4
	add $a1, $0, $t0 
	
	# Call to funtion
	
	jal recursive_sum
	  
	
	#Store the returned value in $t2
	
	move $t2, $v0
	

end:	
	j	end	# Infinite loop at the end of the program. 




# TODO2: Implement the abs_diff routine here, or use the one provided
abs_diff:
	sub $t5, $a0, $a1
	slt $t6, $t5, $0
	beq $t6, $0, foobar
	sub $t5, $0, $t5
	move $v0, $t5
	jr $ra
foobar:
	move $v0, $t5
	jr $ra
# TODO3: Implement the recursive_sum routine here, or use the one provided

recursive_sum:
	beq $a1, $0, end_recursive
	addi $sp, $sp, -8
	addi $a1, $a1, -4
	sw $ra, 4($sp)
	sw $a1, 0($sp)
	jal recursive_sum
	lw $a1, 0($sp)
	add $t1, $a0, $a1
	lw $t2, 0($t1)
	add $v0, $v0, $t2
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
end_recursive:
	li $v0, 0
	jr $ra