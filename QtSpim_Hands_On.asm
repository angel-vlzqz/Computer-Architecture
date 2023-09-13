.data
value: .word 12
Z: .word 0

.text
.globl main

main:
    li $t2, 25          # Store immediate value 25 into register $t2
    lw $t3, value       # Load value from memory into register $t3
    add $t4, $t2, $t3   # Add $t2 and $t3, store result in $t4
    sub $t5, $t2, $t3   # Subtract $t2 and $t3, store result in $t5
    sw $t5, Z           # Store the result in Z

    # Display the result
    li $v0, 1           # Set $v0 to "1" to open the console
    move $a0, $t5       # Move the result from $t5 to $a0
    syscall

    li $v0, 10          # Set $v0 to "10" to select exit syscall
    syscall             # Exit the program
