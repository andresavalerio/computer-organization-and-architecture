    .text
    .globl main

main:
    # read first input
    li $v0, 5
    syscall
    move $t0, $v0 

    # read second input
    li $v0, 5
    syscall
    move $t1, $v0

    # read third input
    li $v0, 5
    syscall
    move $t2, $v0

    # compares first and second number
    add $t3, $t0, $t1
    sub $t4, $t0, $t1
    abs $t4, $t4
    add $t3, $t3, $t4
    li $t4, 2
    div $t3, $t4
    mflo $t3

    # compares winner and third number
    add $t4, $t3, $t2
    sub $t5, $t3, $t2
    abs $t5, $t5
    add $t4 ,$t4, $t5
    li $t5, 2
    div $t4, $t5
    mflo $t4

exit:
    # prints string
   	li $v0,4
    la $a0, msg
    syscall 

    # prints integer
    li $v0, 1
    move $a0, $t4
    syscall

    # exit command
    li $v0,10
    syscall

    .data
msg: .asciiz "Maior: "