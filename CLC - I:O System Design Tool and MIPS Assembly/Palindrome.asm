#  Palindrome.asm
#-------------------------------------------------
#  Author: Angel Velazquez
#  Creation date: 2023Oct06
#-------------------------------------------------
#  This program reads in a string from the user at
#  at runtime and determines whether the string
#  is a palindrome or not
#-------------------------------------------------

.text
.globl main
.ent main
main:
    li $v0, 4       # system call to print string
    la $a0, text1   # load address
    syscall         # call OS to print

    li $v0, 4       # system call to print string
    la $a0, text2   # load address
    syscall         # call OS to print

    li $v0, 8           # system call to read string
    la $a0, input       # load byte space into address
    la $a1, inputSize   # alloc byte space for string
    move $t0, $a0       # move string into $t0
    syscall             # call OS to await input

    # A = $a2
    # S = $t0
    la $a2, ($t0)       # A = S

    # B = $a3
    la $a3, ($t0)       # B = S

    # *B = $t4
    lb $t4, ($t0)

    li $v0, 4       # system call to print string
    la $a0, ($t4)   # load address
    syscall         # call OS to print

    
    loop:
        beq $t4, $t0, test
        bne $t4, $t0, increment
        setBack:
            sub $t4, $t4, 2         # *B = *B - 2
            bne $t4, $zero, test
        increment:
            add $t4, $t4, 1         # *B++
        
        j loop                      # return to loop

    test:
        # if A >= B
        sge $t1, $a2, $a3
        bnez $t1, palindrome

        # if A <> 'B
        # nor??
        bne $a2, $a3, notPalindrome

        add $a2, $a2, 1         # A++
        sub $a3, $a3, 1         # B--

    palindrome:
        li $v0, 4       # system call to print string
        la $a0, input   # load address
        syscall         # call OS to print

        li $v0, 4       # system call to print string
        la $a0, text3   # load address
        syscall         # call OS to print

    notPalindrome:
        li $v0, 10
        syscall
        .end main
   
#-------------------------------------------------
#  Done, terminate program.
li $v0, 10
syscall # all done!
.end main
#-------------------------------------------------

.data
    text1: .asciiz "This program will ask you for a word. 
If your word is a palindrome, I will tell you. If not, I will tell you.\n"
    text2:      .asciiz "Enter a word: "
    text3:      .asciiz "is a palindrome."
    text4:      .asciiz "is NOT a palindrome."
    input:      .space 80
    inputSize:  .space 80
