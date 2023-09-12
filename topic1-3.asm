.data
input: .space 4     #create variable to store input

.text
.globl main

main:
    li $v0, 5       #system call to read an integer
    syscall
    move $s0, $v0   #move into register $s0, $v0

    li $v0, 4       #system call to print a string
    la $a0, input
    syscall

    li $v0, 10      #system call for exiting the program
    syscall