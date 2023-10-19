#  shift.asm
#-------------------------------------------------
#  Author: Angel Velazquez
#  Creation date: 2023Oct19
#-------------------------------------------------
#  shift operations
#-------------------------------------------------

.text
.globl main
.ent main
main:
    lw $t0, value
    sll $t1, $t0, 1
    srl $t2, $t0, 1

    li $v0, 1       # system call to print string
    move $a0, $t0   # load address
    syscall         # call OS to print

    li $v0, 4       # system call to print string
    la $a0, nline   # load address
    syscall         # call OS to print

    li $v0, 1       # system call to print string
    move $a0, $t1   # load address
    syscall         # call OS to print

    li $v0, 4       # system call to print string
    la $a0, nline   # load address
    syscall         # call OS to print

    li $v0, 1       # system call to print string
    move $a0, $t2   # load address
    syscall         # call OS to print

    li $v0, 4       # system call to print string
    la $a0, nline   # load address
    syscall         # call OS to print


#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main
#-------------------------------------------------

.data
value: .word 167
nline: .asciiz "\n"
