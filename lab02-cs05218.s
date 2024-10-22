
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
    #code here
    .data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
 #   j  findLast_forwards_withIndex
 #   j  findLast_forwards_withPointers

    beq  a1, zero, ret0 #if a1 == 0 go to ret0
    slli s0, a1, 2  #s0 = 4*a1
    add  s0, s0, a0 #s0 - 4*a1 + a0
loop:
    addi s0, s0, -4   # s0-=1
    lw   t1, 0(s0)    
    beq  t1, a2, done # if t1 == a2 done
    bne  s0, a0, loop # loop(while)
ret0:
    add  s0, zero, zero  #return address - not found
# Do not remove the prog label or write code above it!
#-----------------------------
done:
    addi a7, zero, 10 
    ecall