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
    li $v0, 4       # system call to print string
    la $a0, text1   # load address
    syscall         # call OS to print

    li $v0, 5       # system call to read integer
    syscall         # call OS to await input
    move $t0, $v0   # move input into $t0

    li $v0, 4       # system call to print string
    la $a0, newLine # load address
    syscall         # call OS to print

    li $v0, 4       # system call to print string
    la $a0, text2   # load address
    syscall         # call OS to print

    li $v0, 4       # system call to print string
    la $a0, newLine # load address
    syscall         # call OS to print

# ----------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main