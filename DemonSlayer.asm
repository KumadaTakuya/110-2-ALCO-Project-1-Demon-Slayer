
.globl  main

.data 
	Input: .string  "Input a number:\n"
	Output: .string  "The damage:\n"
	
.text
	# s6 is output
	# s2 is 20, s3 is 10, s4 is 1, s5 is 0
	# s7 is temp
main:
	addi s2,x0,20
	addi s3,x0,10
	addi s4,x0,1
	addi s5,x0,0
	
	la a0, Input
	li a7, 4
	ecall
	li a7, 5
	ecall
	
	mv s6,a0
	jal ra, F
	
	la a0, Output
	li a7, 4
	ecall
	
	mv a0,s6
	li a7,1
	ecall
	li a7,10
	ecall
F:
	blt s2,s6,L1 # return 2 * x + F(x/5),x > 20
	blt s3,s6,L2 # return F(x - 2) + F(x - 3), 10 < x
	blt s4,s6,L3 # return F(x - 1) + F(x - 2), 1<x<=10
	beq s6,s4,L4 #return 5, x == 1
	beq s6,s5,L5 #return 1, x == 0
	beq x0,x0 L6 #othercase
	
L1:
	addi sp, sp, -8
	sw ra, 0(sp)
	sw s6, 4(sp)
	addi t0,x0,5 #to == 5
	div s6,s6,t0
	jal ra,F
	
	lw s7,4(sp)
	addi t0,x0,2
	mul s7,s7,t0
	add s6,s6,s7
	
	lw ra, 0(sp)
	addi sp,sp,8
	jalr x0, 0(ra)

L2:
	addi sp, sp, -12
	sw ra, 0(sp)
	sw s6, 4(sp)
	addi s6,s6,-2
	jal ra,F
	sw s6,8(sp)
	
	lw s6, 4(sp)
	addi s6,s6,-3
	jal ra,F
	
	lw s7,8(sp)
	add s6,s6,s7
	
	lw ra, 0(sp)
	addi sp,sp,12
	jalr x0, 0(ra)

L3:
	addi sp, sp, -12
	sw ra, 0(sp)
	sw s6, 4(sp)
	addi s6,s6,-1
	jal ra,F
	sw s6,8(sp)
	
	lw s6, 4(sp)
	addi s6,s6,-2
	jal ra,F
	
	lw s7,8(sp)
	add s6,s6,s7
	
	lw ra, 0(sp)
	addi sp,sp,12
	jalr x0, 0(ra)
	
L4:
	addi s6,x0,5
	jalr x0 0(ra)
L5:
	addi s6,x0,1
	jalr x0 0(ra)
L6:
	addi s6,x0,-1
	jalr x0 0(ra)