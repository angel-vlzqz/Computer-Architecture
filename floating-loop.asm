#  Name and general description of program
# ----------------------------------------

.data
num:        .float 0.0
read:       .asciiz "Enter a float (enter 0 to quit loop: "
print:      .asciiz "The number is: "
newLine:    .asciiz "\n"
goodBye:    .asciiz "Goodbye\n"

# ----------------------------------------

.text
.globl main
.ent main

main:
    loop:
        li $v0, 4       # system call to print string
        la $a0, read    # load address to be print spring
        syscall         # call OS to print

# -----
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main