#  This program exemplifies integer arithmetic
#  To find volume and surface area of a prism
# ----------------------------------------
.data

aSide:          .word 73    # define side lengths
bSide:          .word 14
cSide:          .word 16

volume:         .word 0     # define initial volume, surfaceArea
surfaceArea:    .word 0
# ----------------------------------------

.text
.globl main
.ent main
main:
                    # load variables into registers
lw $t0, aSide       
lw $t1, bSide
lw $t2, cSide
                    # volume = aSide * bSide * cSide
mul $t3, $t0, $t1   # aSide * bSide
mul $t4, $t3, $t2   # result * cSide

                    # surfaceArea = 2*(aSide*bSide+aSide*cSide+bSide*cSide)
mul $t3, $t0, $t1   # a * b
mul $t4, $t0, $t2   # a * c
mul $t5, $t1, $t2   # b * c

add $t6, $t3, $t4
add $t7, $t6, $t5

mul $t7, $t7, 2
sw  $t7, surfaceArea    # store result into surfaceArea

#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main