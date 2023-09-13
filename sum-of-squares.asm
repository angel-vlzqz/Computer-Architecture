#  Sum of Squares test program
# ----------------------------------------

.data
n:              .word 10
sumOfSquares:   .word 0

# ----------------------------------------

.text
.globl main
main:
lw $t0, n               # load variables into registers
li $t1, 1               # loop index (1 to n)
li $t2, 0               # sum

sumLoop:
    mul $t3, $t1, $t1   # index^2 ??
    add $t2, $t2, $t3

    add $t1, $t1, 1
    ble $t1, $t0, sumLoop

    sw  $t2, sumOfSquares

# ----------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main