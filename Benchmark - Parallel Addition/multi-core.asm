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

# Assume arrays A and B are of equal length,
# and their addresses are in registers 
# $a0 and $a1, respectively.
# The result will be stored in array A.

# Entry point of the program
main:
    # Initialize loop counters
    lw $t0, core0Counter
    lw $t1, core1Counter
    lw $t2, core2Counter
    lw $t3, core3Counter

    # Loop to perform parallel computation
    parallelLoopEnter:
        # Load elements from arrays A and B
        lw $s0, 0($a0)  # A[i]
        lw $s1, 0($a1)  # B[i]

        # Perform the addition
        add $s0, $s0, $s1  # A[i] = A[i] + B[i]

        # Store the result back in array A
        sw $s0, 0($a0)

        # Increment loop counters
        addi $a0, $a0, 4  # Move to the next element in array A
        addi $a1, $a1, 4  # Move to the next element in array B

        # Increment counters based on the chunk size
        addi $t0, $t0, 1
        addi $t1, $t1, 1
        addi $t2, $t2, 1
        addi $t3, $t3, 1

        # Check if the loop is complete for all cores
        bne $t0, chunkSize, parallelLoopEnter
        bne $t1, 2 * chunkSize, parallelLoopEnter
        bne $t2, 3 * chunkSize, parallelLoopEnter
        bne $t3, arrayLength, parallelLoopEnter

    # Exit the program
    j $ra


#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main
#-------------------------------------------------

.data
# Number of elements in the array
arrayLength = 10

# Calculate the chunk size for each core
chunkSize = arrayLength / 4

# Initialize loop counters for each core
core0Counter: .word 0
core1Counter: .word chunkSize
core2Counter: .word 2 * chunkSize
core3Counter: .word 3 * chunkSize