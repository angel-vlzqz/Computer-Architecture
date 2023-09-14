#  Name and general description of program
# ----------------------------------------

.data
num:        .float 0.0
read:       .asciiz "Enter a float (enter 0 to quit loop): "
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
        la $a0, read    # load address to be print string
        syscall         # call OS to print

        li $v0, 6       # system call to read float
        syscall         # call OS to await input
        s.s $f0, num    # store input in $f0 into num


        li $v0, 4       # system call to print string
        la $a0, print   # load address to be print string
        syscall         # call OS to print

        li $v0, 2       # system call to print float
        l.s $f12, num   # load input into $f12 as float
        syscall         # call OS to print

        li $v0, 4       # system call to print string
        la $a0, newLine # load address to print string
        syscall         # call OS to print

        li $v0, 4       # system call to print string
        la $a0, newLine # load address to print string
        syscall         # call OS to print

        lw   $t0, num
        bnez $t0, loop

    li $v0, 4       # system call to print string
    la $a0, goodBye # load string into $a0 as an asciiz
    syscall         # call OS to print

# ----------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main