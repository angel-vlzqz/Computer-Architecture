#  Palindrome.asm
#-------------------------------------------------
#  Author: Angel Velazquez
#  Creation date: 2023Oct06
#-------------------------------------------------
#  This program reads in a string from the user at
#  at runtime and determines whether the string
#  is a palindrome or not
#-------------------------------------------------

.text
.globl main
.ent main
main:
    li $v0, 4           # system call to print string
    la $a0, text1       # load address
    syscall             # call OS to print

    li $v0, 4           # system call to print string
    la $a0, text2       # load address
    syscall             # call OS to print

    li $v0, 8           # system call to read string
    la $a0, input       # load byte space into address
    la $a1, inputSize   # alloc byte space for string
    syscall             # call OS to await input

    la $t1, input       # load input string into $t1 and $t2
    la $t2, input

    loop:
        lb   $t3, ($t2)     # load first byte from string to $t3
        beqz $t3, endLoop   # jump to end of loop
        addu $t2, $t2, 1    # keep incrementing till reaches 0
        j loop              # jump to loop

    endLoop:
        subu $t2, $t2, 2    # decrement to end of string

    test:
        bge $t1, $t2, palindrome    # if A >= B, palindrome
        lb  $t3, ($t1)              # load byte from A to $t3
        lb  $t4, ($t4)              # load byte from B to $t4
        bne $t3, $t4, notPalindrome # if A == B, notPalindrome

        addu $t1, $t1, 1            # A++
        subu $t2, $t2, 1            # B--
        
        j test                      # jump to test

    palindrome:
        li $v0, 4       # system call to print string
        la $a0, input   # load address
        syscall         # call OS to print

        li $v0, 4       # system call to print string
        la $a0, text3   # load address
        syscall         # call OS to print

    notPalindrome:
        li $v0, 10
        syscall
        .end main
   
#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main
#-------------------------------------------------

.data
    text1: .asciiz "This program will ask you for a word. 
If your word is a palindrome, I will tell you. If not, I will tell you.\n"
    text2:      .asciiz "Enter a word: "
    text3:      .asciiz "is a palindrome."
    text4:      .asciiz "is NOT a palindrome."
    text5:      .asciiz "Would you like to continue? Enter y/n: "
    input:      .space 80
    inputSize:  .space 80
    userBreak:  .space 10 # user defines break or not
