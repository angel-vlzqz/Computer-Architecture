#  fibonacci.asm
#-------------------------------------------------
#  Author: Angel Velazquez
#  Creation date: 2023Oct19
#-------------------------------------------------
#  This program utilizes reccursion using the
#  jal and jr procedures
#-------------------------------------------------

.text
.globl main
.ent main
main:


#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main
#-------------------------------------------------

.data
