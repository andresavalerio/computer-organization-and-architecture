    .text
    .globl main

main:
    # Load Immediate value 6
    li $t0, 6 # loop counter

    # Load Immediate value 6
    lw $t1, counter # positives counter
loop:
    # reading input
    li $v0, 5
    syscall
    move $t2, $v0
    
    # verifying if input is positive
    bgtz $t2, positives

    # else, return to loop
    # Add Immediate negative number (subi)
    addi $t0, $t0, -1 # decrementing loop counter

    bnez $t0, loop # jump to loop
    
    j exit

positives:
    add $t1, $t1, 1 # incrementing positives counter

    # Add Immediate negative number (subi)
    addi $t0, $t0, -1 # decrementing loop counter

    bnez $t0, loop # jump to loop

exit:
    # prints integer
    li $v0, 1
    move $a0, $t1 # prints positives counter
    syscall

    # prints string
   	li $v0, 4
    la $a0, msg
    syscall

    # exit command
    li $v0,10
    syscall

    .data
counter: .word 0
msg: .asciiz " valores positivos"