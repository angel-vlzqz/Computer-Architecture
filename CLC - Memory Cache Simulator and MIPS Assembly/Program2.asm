#  Prints the larger of two numbers specified
#  at runtime by the user
# ----------------------------------------

.data
text1:   .asciiz "Enter a number: "
text2:   .asciiz "Enter another number: "
text3:   .asciiz "The larger of the two numbers is: "

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
    la $a0, text2   # load address
    syscall         # call OS to print

    li $v0, 5       # system call to read integer
    syscall         # call OS to await input
    move $t1, $v0   # move input into $t0

    li $v0, 4       # system call to print string
    la $a0, text3   # load address
    syscall         # call OS to print

    slt $t2, $t0, $t1           # set if less than
    bnq $t2, $zero, greaterThan # branch if $t0 is greater than $t1 

# ----------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main