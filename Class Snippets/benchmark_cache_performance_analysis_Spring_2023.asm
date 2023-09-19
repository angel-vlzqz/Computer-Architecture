# Benchmark-Cache-Performance-Analysis.asm
#-------------------------------------------------
# Author: William B Hurst
# Creation date: 2019Sep18
#-------------------------------------------------
# this is a simple program that demonstrates
# how a computer system that utilizes 4-Byte Words
# can have significantly different Performance
# characteristics based on whether it uses
# Main Memory and Cache Data Transfer configurations of:
#
# 1) One Block Word
# 2) Four Block Words
# 3) Non-Burst
# 4) Burst
#
# from a computer system that utilizes:
#
# *)  4 byte words
#------------------------------------------------- 
# the system has the following characteristics
#-------------------------------------------------
#        Observed Miss Penalty Rates of
#-------------------------------------------------
# *)  1 Clock Cycle to Read from Main Memory
# *)  3 clock Cycles to transfer the 4 blocks of data
#-------------------------------------------------
#
# The program asks the user to input:
#
# *) One  word block miss penalty rate
# *) Four word block miss penalty rate
#
#-------------------------------------------------
# the data will be stored as follows in the program:
#
# 	$t0 - used to hold the first number
# 	$t1 - used to hold the second number
# 	$t2 - used to hold multiplication of $t0 * $t1
#-------------------------------------------------

	.text
	.globl	main
main:
	#----------------------------------------------------------------------
	li	$v0, 4		
	la	$a0, programDesc	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, oWMissRateReq	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 6			
	syscall				
	#----------------------------------------------------------------------
	s.s	$f0, oWordMissRate	
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, fWMissRateReq	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 6			
	syscall				
	#----------------------------------------------------------------------
 	s.s	$f0, fWordMissRate	
	#----------------------------------------------------------------------
	# perform the intended operation - multiply 
	#  Miss_Penalty_ave = (Miss_Penalty_rate)(Miss_Penalty_Cycles)
	#----------------------------------------------------------------------
	# One Word Miss Penalty Calculations
	#----------------------------------------------------------------------
	l.s	$f0, oWordMissRate	
	l.s	$f1, oWordMissCTime	
	mul.s	$f2, $f0, $f1		
	s.s	$f2, oWordMissAve	
	#----------------------------------------------------------------------
 	li	$v0, 4			
	la	$a0, oWordMissCalcOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 4			
	la	$a0, oWordMissRateOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, oWordMissRate	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, oWordMissCTimeOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, oWordMissCTime	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, oWordMissAveOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, oWordMissAve	
	syscall				
	#----------------------------------------------------------------------
	# Four Word (Non-Burst) Miss Penalty Calculations
	#----------------------------------------------------------------------
	l.s	$f0, fWordMissRate	
	l.s	$f1, nbfWordMissCTime	
	mul.s	$f2, $f0, $f1		
	s.s	$f2, nbfWordMissAve	
	#----------------------------------------------------------------------
 	li	$v0, 4			
	la	$a0, nbfWordMissCalcOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 4			
	la	$a0, nbfWordMissRateOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, fWordMissRate	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, nbfWordMissCTimeOut  
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, nbfWordMissCTime	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, nbfWordMissAveOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, nbfWordMissAve	
	syscall				
	#----------------------------------------------------------------------
	# Four Word (Burst) Miss Penalty Calculations
	#----------------------------------------------------------------------
	l.s	$f0, fWordMissRate	
	l.s	$f1, bfWordMissCTime	
	mul.s	$f2, $f0, $f1		
	s.s	$f2, bfWordMissAve	
	#----------------------------------------------------------------------
 	li	$v0, 4			
	la	$a0, bfWordMissCalcOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 4			
	la	$a0, bfWordMissRateOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, fWordMissRate	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, bfWordMissCTimeOut  
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, bfWordMissCTime	
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, bfWordMissAveOut	
	syscall				
	#----------------------------------------------------------------------
 	li	$v0, 2			
	l.s	$f12, bfWordMissAve	
	syscall					
	#----------------------------------------------------------------------
	li	$v0, 4			
	la	$a0, theEnd		
	syscall				
	#----------------------------------------------------------------------
	li	$v0, 10			
	syscall				
	#----------------------------------------------------------------------
	.data
#-----------------------------------
oWordMissRate:		.float	0.0
oWordMissCTime:		.float	5.0
oWordMissAve:		.float	0.0
#-----------------------------------
fWordMissRate:		.float	0.0
#-----------------------------------
nbfWordMissCTime:	.float	20.0
nbfWordMissAve:		.float	0.0
#-----------------------------------
bfWordMissCTime:	.float	8.0
bfWordMissAve:		.float	0.0
#-----------------------------------------------------------------------------
programDesc:		.asciiz "This program is designed to demonstrate 
\n'Benchmark Cache Performance Impacts' through the 'Cache Miss Penalty Variances' 
\nthat are found from: 
\n\t'different System Block Sizes' and from: 
\n\t'different Data Tranfer Policies. 
\n\nThe Different Block sizes compared here are: 
\n\t'(1 Word Block) vs. (4 Word Block)'. 
\n\nAnd the different I/O Policies compared here are:
\n\t'(NonBurst) vs (Burst)' Data Transfer.
\n\nIn order for me to accomplish this 'Lofty Goal' through this program, 
\n\n\tI DESPERATELY NEED YOUR HELP! 
\nI need for you to 'Please provide the Two Primary Data Factors' that I am missing; 
\nThose factors are:"
oWMissRateReq:	.asciiz	"\nPlease enter a (1-Word Block) Percent Miss Penalty Rate:\t  "
fWMissRateReq:	.asciiz	"\nPlease enter a (4-Word Block) Percent Miss Penalty Rate:\t  "
#-----------------------------------------------------------------------------
oWordMissCalcOut: .asciiz "\n\n
=============================================================================================\n
\t        One Word Block Miss Penalty Calculation Results\n
=============================================================================================\n"
#-----------------------------------------------------------------------------
oWordMissRateOut:	.asciiz	"\nUsing a One-Word Block Percent Miss Penalty Rate of: \t\t\t"
oWordMissCTimeOut:	.asciiz "\nthe (One-Word Block) Miss Penalty Cycle Time is: \t\t\t\t"
oWordMissAveOut:	.asciiz "\nMaking your One-Word Block Miss Penalty Average: \t\t\t\t"
#-----------------------------------------------------------------------------
nbfWordMissCalcOut: .asciiz "\n\n
=============================================================================================\n
\t        Four Word Block (Non-Burst) Miss Penalty Calculation Results\n
=============================================================================================\n"
#-----------------------------------------------------------------------------
nbfWordMissRateOut:	.asciiz	"\nUsing a Four-Word Block (Non-Burst) Percent Miss Penalty Rate of: \t\t"
nbfWordMissCTimeOut:	.asciiz "\nthe Four-Word Block (Non-Burst) Miss Penalty Cycle Time is: \t\t"
nbfWordMissAveOut:	.asciiz "\nMaking your Four-Word Block (Non-Burst) Miss Penalty Average: \t\t"
#-----------------------------------------------------------------------------
bfWordMissCalcOut: .asciiz "\n\n
============================================================================================\n
\t        Four Word Block (Burst) Miss Penalty Calculation Results\n
============================================================================================\n"
#-----------------------------------------------------------------------------
bfWordMissRateOut:	.asciiz	"\nUsing a Four-Word Block (Burst) Percent Miss Penalty Rate of: \t\t"
bfWordMissCTimeOut:	.asciiz "\nthe Four-Word Block (Burst) Miss Penalty Cycle Time is: \t\t\t"
bfWordMissAveOut:	.asciiz "\nMaking your Four-Word Block (Burst) Miss Penalty Average: \t\t\t"
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
cflf:   .asciiz	"\n"
theEnd: .asciiz "\n\n
===========================================================================================\n
\t\t\t<<<<<<< The End >>>>>>>\n
===========================================================================================\n"
