#  fibonacci.asm
#-------------------------------------------------
#  Author:  Alex Utzerath, Angel Velazquez
#  Creation date: 2023Oct19
#-------------------------------------------------
#  This program utilizes reccursion and 
#  stack management using the
#  jal and jr procedures
#-------------------------------------------------

.text
.globl main
main:
    # Prompt the user for n (position in the Fibonacci sequence)
    li $v0, 4                   # Load immediate value 4 into $v0 (service code for printing a string)
    la $a0, prompt              # Load the address of the "Enter the position..." prompt into $a0
    syscall                     # Call the system service to print the prompt

    # Read user input for n
    li $v0, 5                   # Load immediate value 5 into $v0 (service code for reading an integer)
    syscall                     # Call the system service to read an integer from the user
    move $t0, $v0               # Move user input to $t0 for Fibonacci calculation

    # Display the "Fibonacci number corresponding to input" message
    li $v0, 4                   # Load immediate value 4 into $v0 (service code for printing a string)
    la $a0, result_message      # Load the address of the result message into $a0
    syscall                     # Call the system service to print the message

    # Call the Fibonacci function
    jal fibonacci                # Jump and link to the Fibonacci function

    # Display the result
    li $v0, 1                   # Load immediate value 1 into $v0 (service code for printing an integer)
    move $a0, $v0               # Move the result of the Fibonacci function to $a0
    syscall                     # Call the system service to print the result

    # Print a newline
    li $v0, 4                   # Load immediate value 4 into $v0 (service code for printing a string)
    la $a0, newline             # Load the address of the newline character into $a0
    syscall                     # Call the system service to print a newline character

    # Exit
    li $v0, 10                  # Load immediate value 10 into $v0 (service code for program exit)
    syscall                     # Call the system service to exit the program

# Fibonacci function
fibonacci:
    # Base cases
    li $t0, 0                   # F(0)
    beq $t0, $t0, base_case      # Check if n is 0

    li $t0, 1                   # F(1)
    beq $t0, $t0, base_case      # Check if n is 1

    # Recursive cases
    addi $t0, $t0, -1
    jal fibonacci                # Calculate F(n-1)

    move $t1, $v0                # Save F(n-1)

    addi $t0, $t0, -1
    jal fibonacci                # Calculate F(n-2)

    move $t2, $v0                # Save F(n-2)

    add $v0, $t1, $t2            # F(n) = F(n-1) + F(n-2)

    # Return
    jr $ra

base_case:
    # F(0) or F(1) is 1, so return 1
    li $v0, 1
    jr $ra
#-------------------------------------------------

.data
newline: .asciiz "\n"          # Newline character for formatting
prompt:  .asciiz "Enter the position in the Fibonacci sequence: "  # Prompt for user input

# Message for the result
result_message: .asciiz "Fibonacci number corresponding to input: "
