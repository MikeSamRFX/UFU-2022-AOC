.data

	arr: .space 40
	entrada: .asciiz "Insira um numero:"
	
.text
	
	jal ESCREVER #Chamada da funcao para escrever no vetor
	
	jal LER      #Chamada da funcao para ler o vetor e retornar a multiplicacao resultante de todos os itens do vetor em $s4
	
	add $a0, $s4, $zero
	addi $v0, $zero, 1 #printar o resultado
	syscall
	
	#return 0
	addi $v0, $zero, 10
	syscall



ESCREVER:

	la	$t7, arr 		# carrega o endereco do vetor
	
	add	$s0, $zero, $zero	# i = 0
	
FOR:	slti	$t0, $s0, 10		# i < 10
	beq	$t0, $zero, SAI		# Sai do for
	
	la	$a0, entrada
	addi	$v0, $zero, 4
	syscall
	
	addi	$v0, $zero, 5		# le um inteiro do teclado
	syscall				
	sw	$v0, 0($t7)		#salva no vetor
	addi	$t7, $t7, 4		#aponta t7 pra proxima casa do vetor
	
	addi $s0, $s0, 1		# i++
	j	FOR			# repete
SAI:


jr $ra					#return







LER:

	la	$t7, arr		# carrega o endereco do vetor
	lw	$t2, 0($t7)
	addi	$t7, $t7, 4
	
	add 	$s4, $zero, $zero
	add	$s4, $t2, $zero
	
	add	$s0, $zero, $zero	# i = 0
	
FOR1:	slti	$t0, $s0, 9		# i < 10
	beq	$t0, $zero, SAI1	# Sai do for
	
	lw	$t2, 0($t7)		# carrega em a0 o que tem na casa apontada do vetor
	addi	$t7, $t7, 4		# aponta para a proxima casa do vetor
	mul 	$s4, $s4, $t2		# intera na soma dos valores do vetor
	
	addi $s0, $s0, 1		# i++
	j	FOR1
	
SAI1:

jr $ra					# return
