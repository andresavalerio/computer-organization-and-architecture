#########################################################
# ASSEMBLY MIPS
# Created by Andresa Valério
#
# Get user input of an integer
# If number greater than 0, print integer double
#########################################################

    .data
msg1: .asciiz "Enter integer: "
fnl: .asciiz "\nFinishing script.\n"

    .text
    .globl main

main:
    # printing message to user
    li $v0,4
    la $a0, msg1
    syscall

    # recieving user input
    li $v0,5
    syscall
    move $t0,$v0 # moving input to register

    # if clause
    blez $t0, exit
    add $t0, $t0, $t0 #calculating double

    # printing integer
    li $v0, 1
    move $a0, $t0
    syscall

exit:
    # printing message to user
    li $v0,4
    la $a0, fnl
    syscall

    # ending script
    li	$v0,10
    syscall
