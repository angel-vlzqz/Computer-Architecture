#  Prints the larger of two numbers specified
#  at runtime by the user
# ----------------------------------------

.data
num1: .word 0
num2: .word 0
text1:   .asciiz "Enter a number: "
text2:   .asciiz "Enter another number: "
text3:   .asciiz "The larger of the two numbers is: "
newLine: .asciiz "\n"

# ----------------------------------------

.text
.globl main
.ent main
main:


# ----------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main