.data
input: .space 4     #create variable to store input

.text
.globl main

main:
    li $v0, 5       #system call to read an integer
    syscall
    move $s0, $v0   #move into register $s0, $v0