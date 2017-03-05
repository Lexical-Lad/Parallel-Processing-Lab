#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>

int main()
{
    int m,n;
    int i,j;
    int arr[100][100];
    int sum=0;
    int **p;

    printf("Enter the number of rows and columns, in that order \n");

    scanf("%d%d",&m,&n);

    printf("Enter the elements row-wise :\n");

    p=(int **)malloc(sizeof(int *)*(m*n));


    for(i=0;i<m;i++)
    {
        for(j=0;j<n;j++)
        {
            scanf("%d",&arr[i][j]);
            *(p+(i*n+j))=&arr[i][j];
        }

    }



    for(i=0;i<(m*n);i++)
    {
        //printf("%d \n",**(p+i));
        sum+=**(p+i);


    }



    printf("The sum : \t %d \n",sum);



}

