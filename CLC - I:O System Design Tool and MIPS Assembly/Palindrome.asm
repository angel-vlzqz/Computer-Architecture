#  Palindrome.asm
#-------------------------------------------------
#  Author: Angel Velazquez
#  Creation date: 2023Oct06
#-------------------------------------------------
#  This program reads in a string from the user at
#  at runtime and determines whether the string
#  is a palindrome or not
#-------------------------------------------------

.data

#-------------------------------------------------

.text
.globl main
.ent main
main:


#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main