.data

	cone: .asciiz "Y"
	sorvete: .asciiz "O"
	space: .asciiz " "
	endl: .asciiz "\n"

.text
	addi $v0 $zero 5
	syscall
	add $s7 $v0 $zero # n = s7
	
	jal SORVETE
	
	addi $v0 $zero 10
	syscall
	
SORVETE:
	
	addi $s2 $zero 0 #s2 = space_cone;
	
	addi $s3 $zero 0 #s3 = space_cone_in;
	
	addi $s4 $zero 0 #s4 = ball;
	
	addi $s5 $zero 0 #s5 = space;
	
	#condicao: if n(s7) e impar ou par?
	andi $t1 $s7 0x01
	bne  $t1 $zero else
	#------------------------------------------------
	
	#if ->
	add $s5 $s7 $zero
	mul $s3 $s7 2
	addi $s3 $s3 -1
	
	j leave1
	
	else:
	
	add $s5 $s7 $zero
	mul $s3 $s7 2
	add $s3 $s3 $zero
	
	leave1:
	
	add $s0 $zero $zero # i = 0
	
	addi $s6 $s7 1 	    # n + 1
	ForMainSorvete:
	slt $t1 $s0 $s6
	beq $t1 $zero SaiForMainSorvete
	#--------------------------------------------------------------

	
	
	#--------------------------------------------------------------
	addi $s0 $s0 1
	j	ForMainSorvete
	
	
	SaiForMainSorvete:
	
	
	
	add $s0 $zero $zero # i = 0
	ForMainCasca:
	slt $t1 $s0 $s7
	beq $t1 $zero SaiForMainCasca
	#--------------------------------------------------------------
	
	
	
	#--------------------------------------------------------------
	addi $s0 $s0 1
	j	ForMainCasca
	
	
	SaiForMainCasca: