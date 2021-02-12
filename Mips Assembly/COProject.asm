.data 
 NewLine: .asciiz " \n "
 ArrSizeMsg: .asciiz "Enter the size of the list <Maximum 25 element> \n"
 ChooseSrtTypMsg: .asciiz "Enter the type of sorting (1)for bubble sort,or (2)for selection sort "
 array: .word 0
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
    addi $t0 ,$v0,0 
    #Make $t3 equal zero to become the list index
    addi $t3,$zero,0
    #Print Message EntrElmntMsg \n
    li $v0, 4
    la $a0 ,EntrElmntMsg
    syscall
    #to git elemints from s1 & store in list
    la $s1,array
     #Loop to input
    ForLoop:
        #condition to exit loop if loop counter(ArraySize) became zero
        beq $t3,$t0,exit
    
         #take array elements
         li $v0,5
         syscall
         #store the value in $s1
         sw $v0,0($s1)
         #move to next allocation
         addi $s1,$s1,4
 
         #increment the index
         addi $t3,$t3,1
 
         j ForLoop 
       
    exit:
       #printing a new line
       li $v0,4
       la $a0,NewLine
       syscall
      
       
    #Print Message of Choosing Sorting Type
    li $v0, 4
    la $a0 ,ChooseSrtTypMsg
    syscall
     #scanf("SortType (1 or 2)",&v0);
    li $v0,5
    syscall
  #Switch Branching 
    
    
    
    
    
    
    
    
 #Tell System to End Process
       li $v0,10
       syscall