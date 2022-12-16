## CS 254 Program 5
##
## Compute (25xy - 10x - 6y + 28) / 7
##
## Jonathan Gargano
## April 1, 2021
## 
## Registers:
## $10 base register
## $11 x
## $12 y
## $13 answer
## $14 remainder
## $15 temporary

          .text
		  .globl main
		  
		  
main:

lui  $10, 0x1000    # $10 = base register 0x00001000
lw   $11, 0($10)    # $11 = x
lw   $12, 4($10)    # $12 = y
ori  $13, $0, 28    # $13 = 28
ori  $15, $0, 6     # $15 = 6
mult $15, $12       # 6y
mflo $15            # $15 = 6y
subu $13, $13, $15  # $13 = 28 - 6y
ori  $15, $0, 10    # $15 = 10
mult $15, $11       # 10
mflo $15            # $15 = 10x
subu $13, $13, $15  # $13 = (-6y + 28) -10x
ori  $15, $0, 25    # $15 = 25
mult $11, $12       # xy
mflo $11            # $11 = xy
mult $11, $15       # 25xy
mflo $15            # $15 = 25xy
addu $13, $13, $15  # $13 = (-10x - 6y + 28 ) + 25xy
ori  $15, $0, 7     # $15 = 7
divu $13, $15       # $13 = (25xy -10x - 6y + 28) / 7
mflo $13            # $13 = quotient
mfhi $14            # $14 = remainder
sw   $13, 4($10)    # Store quotient in answer
sw   $14, 8($10)    # Store remainder in remainder



            .data
		  
x:          .word  3
y:          .word  4
answer:     .word  0
remainder : .word  0