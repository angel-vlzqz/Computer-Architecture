#  Name and general description of program
# ----------------------------------------

.data

# ----------------------------------------

.text
.globl main
.ent main
main:


# -----
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main