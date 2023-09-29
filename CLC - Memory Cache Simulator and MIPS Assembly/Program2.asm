#  Prints the larger of two numbers specified
#  at runtime by the user
# ----------------------------------------

.data
num1: .word 0
num2: .word 0

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