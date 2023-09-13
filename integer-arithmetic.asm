#  This program exemplifies integer arithmetic
#  To find volume and surface area of a prism
# ----------------------------------------
#  Data declarations go in this section.
.data

aSide:          .word 73    # define side lengths
bSide:          .word 14
cSide:          .word 16

volume:         .word 0     # define initial volume, surfaceArea
surfaceArea:    .word 0
# ----------------------------------------
#  Program code goes in this section.
.text
.globl main
.ent main
main:
# -----
# your program code goes here.
# -----
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main