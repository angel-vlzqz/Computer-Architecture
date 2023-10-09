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
    li $v0, 4       # system call to print string
    la $a0, text1   # load address
    syscall         # call OS to print

    li $v0, 4       # system call to print string
    la $a0, text2   # load address
    syscall         # call OS to print

#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main
#-------------------------------------------------

.data
    text1: .asciiz "This program will ask you for a word. 
If your word is a palindrome, I will tell you. If not, I will tell you.\n"
    text2: .asciiz "Enter a word: "
    text3: .asciiz " is a palindrome."
    text4: .asciiz " is NOT a palindrome."
    text5: .asciiz "Would you like to continue? Enter y/n: "