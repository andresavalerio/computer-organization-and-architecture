    .text
    .globl main

main:
    # Load Immediate value 6
    li $t0, 5 # loop counter

    # Load Immediate 
    li $t1, 0 # positives counter
    li $t2, 0 # negatives counter
    li $t3, 0 # even counter
    li $t4, 0 # odd counter
    
    li $t5, 2 # register used for even or odd comparison
loop:
    # reading input
    li $v0, 5
    syscall
    move $t6, $v0

verify_sign:
    # verifying if input is positive
    bgtz $t6, positives
    
    addi $t2, $t2, 1 # increment negatives counter
    j verify_even_odd

positives:
    addi $t1, $t1, 1 # incrementing positives counter
    # go to verify_even_odd

verify_even_odd:
    div $t6, $t5 # Divide input by 2
    mfhi $t7
    
    bnez $t7, odd
    addi $t3, $t3, 1 # incrementing even counter
    
    j input_counter
odd:
    addi $t4, $t4, 1 # incrementing odd counter
    # go to input_counter

input_counter:
    # Add Immediate negative number (subi)
    addi $t0, $t0, -1 # decrementing loop counter

    bnez $t0, loop # jump to loop
    # else, go to exit
exit:
    # prints integer
    li $v0, 1
    move $a0, $t3 # prints even counter
    syscall

    # prints string
   	li $v0, 4
    la $a0, emsg
    syscall

    # prints integer
    li $v0, 1
    move $a0, $t4 # prints odd counter
    syscall

    # prints string
   	li $v0, 4
    la $a0, omsg
    syscall
    
    # prints integer
    li $v0, 1
    move $a0, $t1 # prints positive counter
    syscall

    # prints string
   	li $v0, 4
    la $a0, pmsg
    syscall
    
    # prints integer
    li $v0, 1
    move $a0, $t2 # prints negative counter
    syscall

    # prints string
   	li $v0, 4
    la $a0, nmsg
    syscall

    # exit command
    li $v0,10
    syscall

    .data
emsg: .asciiz " valor(es) par(es) \n"
omsg: .asciiz " valor(es) impar(es) \n"
pmsg: .asciiz " valor(es) positivo(s) \n"
nmsg: .asciiz " valor(es) negativo(s)"