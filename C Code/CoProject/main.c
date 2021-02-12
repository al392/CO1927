#include <stdio.h>
#include <stdlib.h>

// The function for printing an array of numbers
void fnPrintArray(int numbers[], int size)
{
    int counter;
    for (counter = 0  ;  counter < size  ;  counter++)
        printf("%d ", numbers[counter]);
    printf("\n");
}

// The function for swapping two numbers
void fnSwap(int *current, int *next)
{
    int temp = *current;
    *current = *next;
    *next = temp;
}


// The function for implementing Bubble Sort Algorithm
void fnBubbleSort(int numbers[], int size)
{
   int iner_iteration, outer_iteration;
   for (outer_iteration = 0  ;  outer_iteration < size-1  ;  outer_iteration++)



       // Last i elements are already in place
        for (iner_iteration = 0  ;  iner_iteration < size-outer_iteration-1  ;  iner_iteration++)
            if (numbers[iner_iteration] > numbers[iner_iteration+1])
                fnSwap(&numbers[iner_iteration], &numbers[iner_iteration+1]);
}



// The function for implementing selection Sort Algorithm
void fnSelectionSort(int arr[],int size){
    int temp,min_index;

    for(int count=0;count<size-1;count++){

               min_index=count;

            for(int i=count;i<=size-1;i++){

                if(arr[i]<arr[min_index]){
                        min_index=i;
                      }
        }


        fnSwap(&arr[min_index],&arr[count]);
   }

}


// sorting using merge
void merge(int arr[], int l, int m, int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;

    /* create temp arrays */
    int L[n1], R[n2];

    /* Copy data to temp arrays L[] and R[] */
    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];

    /* Merge the temp arrays back into arr[l..r]*/
    i = 0; // Initial index of first sub_array
    j = 0; // Initial index of second sub_array
    k = l; // Initial index of merged sub_array
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            i++;
        }
        else {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    /* Copy the remaining elements of L[], if there
    are any */
    while (i < n1) {
        arr[k] = L[i];
        i++;
        k++;
    }

    /* Copy the remaining elements of R[], if there
    are any */
    while (j < n2) {
        arr[k] = R[j];
        j++;
        k++;
    }
}


void mergeSort(int arr[], int l, int r)
{
    if (l < r) {
        // Same as (l+r)/2, but avoids overflow for
        // large l and h
        int m = l + (r - l) / 2;

        // Sort first and second halves
        mergeSort(arr, l, m);
        mergeSort(arr, m + 1, r);

        merge(arr, l, m, r);
    }
}


int binarySearch(int arr[], int l, int r, int x)
{
    if (r >= l) {
        int mid = l + (r - l) / 2;



        // If the element is present at the middle
        // itself
        if (arr[mid] == x)
            return mid;



        // If element is smaller than mid, then
        // it can only be present in left sub_array
        if (arr[mid] > x)
            return binarySearch(arr, l, mid - 1, x);



        // Else the element can only be present
        // in right sub_array
        return binarySearch(arr, mid + 1, r, x);
    }



    // We reach here when element is not
    // present in array
    return -1;
}





int main()
{

    int size,Notype,binarySearchOption,element;

    printf("Enter List Size:");
    scanf("%d", &size); //getting array size form user

    int arr[size];
    printf("Enter List :\n");
    for (int i=0 ; i<size ; i++)
    {
        scanf("%d", &arr[i]);
    } //getting array elements form user

    printf("\nChoose Type of Sorting\n[1] Bubble Sort\n[2] Selection Sort\n[3] Merge Sort\n");
    scanf("%d",&Notype); //getting the number of operation the user wants to perform



    switch(Notype){
        case 1: //Number 1 Bubble sort operation
            fnBubbleSort(arr, size);
            printf("\nSorted List is \n");
            fnPrintArray(arr, size);

            printf("\nIf you want to perform binary search enter 1 if no enter 0\n");
            scanf("%d",&binarySearchOption);
        //checks if the user wants to do a binary search on the sorted array
           if(binarySearchOption== 1 )
           {
                  printf("\nEnter the element you want to search for:"); //getting input from user to enter which element he wants to search
                  scanf("%d",&element);

                  int result = binarySearch(arr, 0, size - 1, element);
                  (result == -1) ? printf("\nElement is not present in the list\n") : printf("\nElement is present at index %d\n",result+1); //checks i the element that the user entered is there or not

                   break;
            }


            else
                break;


        case 2: //Number 1 selection sort operation
            fnSelectionSort(arr,size);
            printf("\nSorted List is \n");
            fnPrintArray(arr,size);

            printf("\nIf you want to perform binary search enter 1 if no enter 0\n");
            scanf("%d",&binarySearchOption);
            //checks if the user wants to do a binary search on the sorted array
            if(binarySearchOption==1){
                    printf("Enter the element you want to search for:"); //getting input from user to enter which element he wants to search
                    scanf("%d",&element);


                    int result = binarySearch(arr, 0, size - 1, element);
                    (result == -1) ? printf("\nElement is not present in the list\n") : printf("\nElement is present at index: %d\n",result+1); //checks i the element that the user entered is there or not
                    break;
            }

            else
                break;
        case 3:
            mergeSort(arr, 0,size - 1);
            printf("\nSorted List is \n");
            fnPrintArray(arr,size);

            printf("\nIf you want to perform binary search enter 1 if no enter 0\n");
            scanf("%d",&binarySearchOption);
            //checks if the user wants to do a binary search on the sorted array
            if(binarySearchOption==1){
                    printf("Enter the element you want to search for:"); //getting input from user to enter which element he wants to search
                    scanf("%d",&element);


                    int result = binarySearch(arr, 0, size - 1, element);
                    (result == -1) ? printf("\nElement is not present in the list\n") : printf("\nElement is present at index: %d\n",result+1); //checks i the element that the user entered is there or not
                    break;
            }

            else
                break;




        default:
            //makes sure that the user choose either operations (bubble sort and selection sort)
            printf("\nInvalid input,please enter 1 or 2 or 3 ");
            break;


    }



    return 0;
}
