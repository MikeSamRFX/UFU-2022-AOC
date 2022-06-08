.data
	str1:.asciiz " "
.text
MAIN:
	#for(i=1, i < 101, i++)
	add $s0, $zero, $at
	
FOR1:
	slti $t0, $s0, 101 #se i < 101
	beq  $t0, $zero, SAI1
	
	#-------------------------------
	
	li  $v0, 4
	la  $a0, str1
	syscall
	li  $v0, 1
	add $a0, $s0, $zero
	syscall
	
	#------------------------------
	addi $s0, $s0, 1
	j    FOR1
	
SAI1:
	#return 0
	li $v0, 10
	syscall
