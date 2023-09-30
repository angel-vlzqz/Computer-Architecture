# Sum of two numbers
# 09/28/2023
#-------------------------------------------------------------------------------------------
# Code written and review by Alec Utzerath (Electrical Engineer Major) 
# and Angel Velazquez (Computer Science Major)
#-------------------------------------------------------------------------------------------
# The purpose of this code is to take to numbers that are inputed by 
# the user and add those numbers together. This program aims to show 
# that the students know how to write MIPS code that prompts the user 
# to input items, stores those items in specific registers, and perform 
# basic addition. The objective of this code is simple and students 
# should come away with a better understanding of how write MIPS code 
# can be used to dirrectly work with the computers hardware using 
# a compiler like QtSpim. 
#-------------------------------------------------------------------------------------------
.data
# Prompt for the first number
prompt1: .asciiz "Enter the first number here: 
"  

# Prompt for the second number
prompt2: .asciiz "Enter the second number here: 
" 

#Prompt for the intial title display
prompt3: .asciiz "This program can help you find the sum of any two integers, to start lets gather some needed information below.

"

# Message for the result
result: .asciiz "The sum of the two numbers is: "               

.text
.globl main

main:
    #Display Inital Message
    li $v0, 4
    la $a0, prompt3
    syscall 

    # Display prompt for the first number
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read the first number that was inputted 
    li $v0, 5
    syscall
    move $t0, $v0

    # Display prompt for the second number
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read the second number that was inputted
    li $v0, 5
    syscall
    move $t1, $v0

    # Calculate the sum of the two numbers
    add $t2, $t0, $t1

    # Display the result
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Exit the program
    li $v0, 10
    syscall