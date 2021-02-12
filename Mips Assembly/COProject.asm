.data 
 NewLine: .asciiz " \n "
 ArrSizeMsg: .asciiz "Enter the size of the list <Maximum 25 element> \n"
 ChooseSrtTypMsg: .asciiz "Enter the type of sorting (1)for Bubble Sort,or (2)for Selection Sort,or(3)for Merge Sort "
 array: .word 0
 List: .word 0:100
 SortedListMsg: .asciiz "\n Sorted List is: \n"
 InvalidInput: .asciiz "\nInvalid input,please enter 1 or 2 or 3 \n"
 EntrElmntMsg: .asciiz "Enter The Elements: \n"
 BinarySearchMsg: .asciiz "If you want to perform binary search enter 1 if not enter 0 : \n"
 ElmntToSearch: .asciiz "Enter the element you want to search for \n"
 ElmntNotExist: .asciiz "Element is not present in the list \n "
 ElmntExistIn: .asciiz "Element is present at index : "
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
  #assign number to $t1   $t1=$v0   <$v0 is the sorting type>
    addi $t1 ,$v0,0 
  #Switch Branching 
  Switch:
      beq $t1,1,Case1
      beq $t1,2,Case2
      beq $t1,3,Case3        
      #Print Message of Invalid Input
      li $v0, 4
      la $a0 ,InvalidInput
      syscall
  #Body of case 1 of switch statements  
  Case1:
  #Call Case One Function
     add $a1,$zero,$s1 # pass the array as an arg
     add $a2,$zero,$t0 #pass the size of list as an arg
     jal fnBubbleSort  #call fn of bubble sort and pass $a1 & $a2 to it as an args
      
  #Print Message of Sorted List is \n
      li $v0, 4
      la $a0 ,SortedListMsg
      syscall
  #call function print array
  jal fnPrintArray
   #Print Message of Binary Search
      li $v0, 4
      la $a0 ,BinarySearchMsg
      syscall
    #Get response from user if he want to search or not
      li $v0,5
      syscall
    #The Responce 
    addi $t4,$v0,0
    
    beq $t4,1,Search
    
  
   jr $ra
  Case2:
    add $a1,$zero,$s1 # pass the array as an arg
     add $a2,$zero,$t0 #pass the size of list as an arg
     jal fnSelectionSort  #call fn of bubble sort and pass $a1 & $a2 to it as an args
      
  #Print Message of Sorted List is \n
      li $v0, 4
      la $a0 ,SortedListMsg
      syscall
  #call function print array
  jal fnPrintArray
   #Print Message of Binary Search
      li $v0, 4
      la $a0 ,BinarySearchMsg
      syscall
    #Get response from user if he want to search or not
      li $v0,5
      syscall
    #The Responce 
    addi $t4,$v0,0
    #Ask if user want to search
    beq $t4,1,Search
    
   jr $ra
  Case3:
    add $a1,$zero,$s1 # pass the array as an arg
     add $a2,$zero,$t0 #pass the size of list as an arg
     jal mergeSort  #call fn of bubble sort and pass $a1 & $a2 to it as an args
      
  #Print Message of Sorted List is \n
      li $v0, 4
      la $a0 ,SortedListMsg
      syscall
  #call function print array
  jal fnPrintArray
   #Print Message of Binary Search
      li $v0, 4
      la $a0 ,BinarySearchMsg
      syscall
    #Get response from user if he want to search or not
      li $v0,5
      syscall
    #The Responce 
    addi $t4,$v0,0
    #Ask if user want to search
    beq $t4,1,Search
    
   jr $ra
 Search:
    #Print Message of Sorted List is \n
      li $v0, 4
      la $a0 ,ElmntToSearch
      syscall  
    #scanf(the element)  
      li $v0,5
      syscall
    #move to $t5
      addi $t5,$v0,0
    #get parameters & call binary search function
      add $a1,$zero,$s1 # pass the array as an arg
      add $a2,$zero,$t0 #pass the size of list as an arg
      jal BinarySearch
      la $a3,BinarySearch
      syscall
      #Show Result
      beq $a3,-1,NotExist
      bne $a3,-1,IsExist       
     IsExist:
       li $v0, 4
       la $a0 ,ElmntIsExist
       syscall
       jr $ra                   
     NotExist:
        li $v0, 4
        la $a0 ,ElmntNotExist
        syscall  
    jr $ra                                  
 #Tell System to End Process
       li $v0,10
       syscall