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
 ans: .word 0
 val: .word 0
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
    # jal fnBubbleSort  #call fn of bubble sort and pass $a1 & $a2 to it as an args

 

  #Print Message of Sorted List is \n
      li $v0, 4
      la $a0 ,SortedListMsg
      syscall
  #call function print array
 # jal fnPrintArray
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
  #   jal fnSelectionSort  #call fn of bubble sort and pass $a1 & $a2 to it as an args

 

  #Print Message of Sorted List is \n
      li $v0, 4
      la $a0 ,SortedListMsg
      syscall
  #call function print array
 # jal fnPrintArray
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
     lw $a0, 0($s1) # pass the array as an arg 
     add $a1,$zero,0  
     add $a2,$zero,$t0 #pass the size of list as an arg

 

  #Print Message of Sorted List is \n
      li $v0, 4
      la $a0 ,SortedListMsg
      syscall
  #call function print array
  #jal fnPrintArray
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
      sw $v0, val
    #get parameters & call binary search function
      lw $a1, 0($s1) # pass the array as an arg
   
      add $a2,$zero,$t0 #pass the size of list as an arg
      
      jal BinarySearch
      sw $v0, ans
      
      li $v0,1
      lw $a0, ans
      syscall

 

      li $v0, 10
      syscall
#########--------------------Selection Sort-------------#############################################





##########-----------------Bubble Sort-------------------############################################

fnBubbleSort:
#a0=address of array
#a1=sizeof size


 

in:
add $t1,$t0,$zero
sll $t1,$t0,2
add $t3,$v0,$zero
sw $t3,array ( $t1 )
addi $t0,$t0,1
slt $t1,$s0,$t0
beq $t1,$zero,in


 

la $a0,array
addi $a1,$s0,1 #a1=6
#call buble_sort
jal buble_sort


 


la $t0,array
#s0=5
add $t1,$zero,$zero
printArray:
lw $a0,0($t0)
li $v0,1
syscall


 

addi $t0,$t0,4
addi $t1,$t1,1
slt $t2,$s0,$t1
beq $t2,$zero,printArray


 

li $v0,10
syscall


 

buble_sort:
#a0=address of table
#a1=sizeof table
add $t0,$zero,$zero #counter1( i )=0


 

loop1:
addi $t0,$t0,1 #i++
bgt $t0,$a1,endloop1 #if t0 < a1 break;


 

add $t1,$a1,$zero #counter2=size=6
loop2:


 

bge $t0,$t1,loop1 #j < = i


 

addi $t1,$t1,-1 #j--


 

mul $t4,$t1,4 #t4+a0=table[j]
addi $t3,$t4,-4 #t3+a0=table[j-1]
add $t7,$t4,$a0 #t7=table[j]
add $t8,$t3,$a0 #t8=table[j-1]
lw $t5,0($t7)
lw $t6,0($t8)


 

bgt $t5,$t6,loop2


 

#switch t5,t6
sw $t5,0($t8)
sw $t6,0($t7)
j loop2


 

endloop1:
jr $ra
jr $ra




###########-----------Merge Sort--------------------###################################################
 
Mergesort: 
	slt $t0, $a1, $a2 	# if low < high then $t0 = 1 else $t0 = 0  
	beq $t0, $zero, Return	# if $t0 = 0, go to Return
	
	addi, $sp, $sp, -16 	# Make space on stack for 4 items
	sw, $ra, 12($sp)	# save return address
	sw, $a1, 8($sp)	       	# save value of low in $a1
	sw, $a2, 4($sp)        	# save value of high in $a2

	add $s0, $a1, $a2	# mid = low + high
	sra $s0, $s0, 1		# mid = (low + high) / 2
	sw $s0, 0($sp) 		# save value of mid in $s0
				
	add $a2, $s0, $zero 	# make high = mid to sort the first half of array
	jal Mergesort		# recursive call to MergeSort
	
	lw $s0, 0($sp)		# load value of mid that's saved in stack 
	addi $s1, $s0, 1	# store value of mid + 1 in $s1
	add $a1, $s1, $zero 	# make low = mid + 1 to sort the second half of array
	lw $a2, 4($sp) 		# load value of high that's saved in stack
	jal Mergesort 		# recursive call to MergeSort
	
	lw, $a1, 8($sp) 	# load value of low that's saved in stack
	lw, $a2, 4($sp)  	# load value of high that's saved in stack
	lw, $a3, 0($sp) 	# load value of mid that's saved in stack and pass it to $a3 as an argument for Merge
	jal Merge		# Go to Merge 	
				
	lw $ra, 12($sp)		# restore $ra from the stack
	addi $sp, $sp, 16 	# restore stack pointer
	jr  $ra

Return:
	jr $ra 			# return to calling routine
	
Merge:
	add  $s0, $a1, $zero 	# $s0 = i; i = low
	add  $s1, $a1, $zero 	# $s1 = k; k = low
	addi $s2, $a3, 1  	# $s2 = j; j = mid + 1

While1: 
	blt  $a3,  $s0, While2	# if mid < i then go to next While loop
	blt  $a2,  $s2, While2	# if high < j then go to next While loop
	j  If			# if i <= mid && j <=high
	
If:
	sll  $t0, $s0, 2	# $t0 = i*4
	add  $t0, $t0, $a0	# add offset to the address of a[0]; now $t2 = address of a[i]
	lw   $t1, 0($t0)	# load the value at a[i] into $t1
	sll  $t2, $s2, 2	# $t1 = j*4
	add  $t2, $t2, $a0	# add offset to the address of a[0]; now $t2 = address of a[j]
	lw   $t3, 0($t2)	# load the value of a[j] into $t3	
	blt  $t3, $t1, Else	# if a[j] < a[i], go to Else
	la   $t4, List		# Get start address of c
	sll  $t5, $s1, 2	# k*4
	add  $t4, $t4, $t5	# $t4 = c[k]; $t4 is address of c[k]
	sw   $t1, 0($t4)	# c[k] = a[i]
	addi $s1, $s1, 1	# k++
	addi $s0, $s0, 1	# i++
	j    While1		# Go to next iteration
	
Else:
	sll  $t2, $s2, 2	# $t1 = j*4
	add  $t2, $t2, $a0	# add offset to the address of a[0]; now $t2 = address of a[j]
	lw   $t3, 0($t2)	# $t3 = whatever is in a[j]	
	la   $t4, List		# Get start address of c
	sll  $t5, $s1, 2	# k*4
	add  $t4, $t4, $t5	# $t4 = c[k]; $t4 is address of c[k]
	sw   $t3, 0($t4)	# c[k] = a[j]
	addi $s1, $s1, 1	# k++
	addi $s2, $s2, 1	# j++
	j    While1		# Go to next iteration
	
While2:
	blt  $a3, $s0, While3 	# if mid < i
	sll $t0, $s0, 2		# # $t6 = i*4
	add $t0, $a0, $t0	# add offset to the address of a[0]; now $t6 = address of a[i]
	lw $t1, 0($t0)		# load value of a[i] into $t7
	la  $t2, List		# Get start address of c
	sll $t3, $s1, 2         # k*4
	add $t3, $t3, $t2	# $t5 = c[k]; $t4 is address of c[k]
	sw $t1, 0($t3) 		# saving $t7 (value of a[i]) into address of $t5, which is c[k]
	addi $s1, $s1, 1   	# k++
	addi $s0, $s0, 1   	# i++
	j While2		# Go to next iteration
	

While3:
	blt  $a2,  $s1, For_Initializer	#if high < j then go to For loop
	sll $t2, $s2, 2    	# $t6 = j*4
	add $t2, $t2, $a0  	# add offset to the address of a[0]; now $t6 = address of a[j]
	lw $t3, 0($t2)     	# $t7 = value in a[j]
	
	la  $t4, List		# Get start address of c
	sll $t5, $s1, 2	   	# k*4
	add $t4, $t4, $t5  	# $t5 = c[k]; $t4 is address of c[k]
	sw $t3, 0($t4)     	# $t4 = c[k]; $t4 is address of c[k]
	addi $s1, $s1, 1   	# k++
	addi $s2, $s2, 1   	# j++
	j While3		# Go to next iteration

For_Initializer:
	add  $t0, $a1, $zero	# initialize $s5 to low for For loop
	addi $t1, $a2, 1 	# initialize $t3 to high+1 for For loop
	la   $t4, List		# load the address of array c into $s7	
	j    For
For:
	slt $t7, $t0, $t1  	# $t4 = 1 if $s5 < $s2
	beq $t7, $zero, sortEnd	# if $t4 = 0, go to sortEnd
	sll $t2, $t0, 2   	# $s5 * 4 to get the offset
	add $t3, $t2, $a0	# add the offset to the address of a => a[$t7]
	add $t5, $t2, $t4	# add the offset to the address of c => c[$t5]
	lw  $t6, 0($t5)		# loads value of c[i] into $t6
	sw $t6, 0($t3)   	# save the value at c[$t0] to a[$t0]; a[i] = c[i]
	addi $t0, $t0, 1 	# increment $t0 by 1 for the i++ part of For loop
	j For 			# Go to next iteration

sortEnd:
	jr $ra			# return to calling routine	
##############-------------------fnPrint---------------------------------------------#############
fnPrintArray:
 li $t5, 0 # i = 0
 la $t6, array # t6 = address of the array
 la $t7, List
 syscall
 lw $t7, 0($t7) # t7 = lengthloop:
 slt $t0, $t5, $t7 # if k < length t0=1
 syscall
 beq $t0, $0, printExit # if i >= 10 exitli $v0, 1 # print an integer
 lw $a0, 0($t6) # address of integer in a0
 syscall
 addi $t6, $t6, 4 # increment address of array by 4(next int)
 addi $t5, $t5,1 # i++li $v0, 4 # print a newline after each int
 la $a0, NewLine # address of space string
 syscall
 
 j loop
 
 jal printExit
printExit:
 li $v0, 10
 syscall
 jr $ra	

  

##############-------------------Binary search----------------------------------------#############

       BinarySearch:
 
 
 
    # middle = (start + end ) / 2
    add $t0, $a1, $a2                   # $t0 = start + end
    sra  $s1, $t0, 1                    # $s1 = $t0 / 2
    mul $s4, $s1,4                      #multiplying it by 4 becasue integers take 4 bytes
 
 
 
    # save $ra in the stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)
 
 
 

 

    # base case
    blt $a2, $a1, returnNegative1       # if (end < start) 
 
 
 
    lw  $t1, array($s4)                   # $t1 = arr[middle]
    lw  $t2, val                        # $t2 = val
    beq $t1, $t2, returnMiddle          # if (arr[middle] == val)
 
 
 
    blt $t2, $t1, returnFirstPart       # if (val < arr[middle])
 
 
 
    bgt $t2, $t1, returnLastPart        # if (val > arr[middle])  
 
 
 
    returnNegative1:
       li $v0, -1
       j Exit       
    returnMiddle:
       move $v0, $s1                    # return middle
       j Exit   
 
 
 
    returnFirstPart:
           move $t3, $s1                # temp = middle     
           addi $t3, $t3, -1            # temp --
           move $a2, $t3                # end = temp
           jal BinarySearch
       j Exit
 
 
 
    returnLastPart:                             
       move $t3, $s1                    # temp = middle
       addi $t3, $t3, 1                 # temp++
       move $a1, $t3                    # start = temp
       jal BinarySearch
       j Exit   
 
 
 
Exit:   
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra                              #return the value of the binary search
