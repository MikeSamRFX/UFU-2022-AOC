.data
	str1: .asciiz "A soma dos dois numeros e:"
	str2: .asciiz "Insira o maior numero:"
	str3: .asciiz "Insira o menor numero:"
.text
MAIN:
	li  $v0, 4
	la  $a0, str3
	syscall
	
	li		$v0, 5
	syscall
	add 		$s6, $v0, $zero
	
	li  $v0, 4
	la  $a0, str2
	syscall
	
	li		$v0, 5
	syscall
	add 		$s7, $v0, $zero
	
	add  $s0, $s6, $zero
	add  $s2, $s7, 1
	
	add $s5, $zero, $zero

FOR1:
	slt $t0, $s0, $s2 #se i < s2
	beq  $t0, $zero, SAI1
	
	#------------------------------
	
	add $s5, $s5, $s0
	
	#------------------------------
	
	addi $s0, $s0, 1
	j    FOR1
	
SAI1:

	li  $v0, 4
	la  $a0, str1
	syscall
	li  $v0, 1
	add $a0, $s5, $zero
	syscall
	
	
	#return 0
	li $v0, 10
	syscall