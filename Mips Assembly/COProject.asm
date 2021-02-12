.data 
 NewLine: .asciiz " \n "
 ArrSizeMsg: .asciiz "Enter the size of the list <Maximum 25 element> \n"
 ChooseSrtTypMsg: .asciiz "Enter the type of sorting (1)for bubble sort,or (2)for selection sort "
 List: .word 0:100
 EntrElmntMsg: .asciiz "Enter The Elements: \n"
.text
  main:
    #print("Enter the size ofarray \n")
    li $v0, 4
    la $a0 ,ArrSizeMsg
    syscall
     #scanf("size",&v0)
    li $v0,5
    syscall
     #assign number to $t0   $t0=$v0   <$v0 is the array size>
    move $t0 ,$v0 
    #Make $t3 equal zero to become the list index
    addi $t3,$zero,0
    #Loop to input
    while:
        #condition to exit loop if loop counter(ArraySize) became zero
        beqz $t0 ,exit
         #Print Message EntrElmntMsg \n
         li $v0, 4
         la $a0 ,EntrElmntMsg
         syscall
    
         #take array elements
         li $v0,5
         syscall
         #move array element to $t1
         move $t1,$v0 
         syscall
         #Put array elemnt in array space in memory
         lw $t4,List($t3)
         syscall
         #Print the current number
       #  li $v0,1
       # move $a0,$t4
       #  syscall
         #increment the list index by 4 to load in next memory space
         #addi $t3,$t3,4
         #decrement th counter(Size) by one
         subi $t0,$t0,1
         syscall
    exit:
       #printing a new line
       li $v0,4
       la $a0,NewLine
       syscall
       #Tell System to End Process
       li $v0,10
       syscall
       #return to While line
       j while
    #Print Message of Choosing Sorting Type
    li $v0, 4
    la $a0 ,ChooseSrtTypMsg
    syscall
     #scanf("SortType (1 or 2)",&v0);
    li $v0,5
    syscall
  #Switch Branching 
    
