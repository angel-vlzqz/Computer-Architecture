#  multi-core example
#-------------------------------------------------
#  Author: Angel Velazquez
#  Creation date: 2023Dec11
#-------------------------------------------------
#  This code snippet is a simple example of how
#  to use the multi-core feature of the MIPS
#  architecture. It is a simple program that
#  creates a new thread and executes a function
#  in it.
#-------------------------------------------------

main:
    # Load the array addresses into registers
    la $t0, array1
    la $t1, array2

    # Load the length of the arrays into a register
    lw $t2, length

    # Calculate the number of iterations (assuming arrays are of equal length)
    # Divide length by 4 (number of cores)
    srl $t3, $t2, 2  

    # Loop for parallel processing
    loop_start:
        # Load elements from arrays
        lw $a0, 0($t0)  # array1
        lw $a1, 0($t1)  # array2

        # Perform addition
        add $a0, $a0, $a1  # Element-wise addition

        # Store the result into array1
        sw $a0, 0($t0)

        # Move to the next element in the arrays
        # Move to the next element (4 words per core)
        addi $t0, $t0, 16  
        addi $t1, $t1, 16

        # Check if we have completed the iterations
        sub $t3, $t3, 1
        bnez $t3, loop_start

#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main
#-------------------------------------------------

.data
    array1: .word 1, 2, 3, 4
    array2: .word 5, 6, 7, 8
    length: .word 4