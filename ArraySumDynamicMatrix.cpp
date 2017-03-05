#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>

int main()
{
    int m,n;
    int i,j;
    int sum=0;
    int **arr;
    int *p;

    printf("Enter the number of rows and columns, in that order \n");

    scanf("%d%d",&m,&n);

    printf("Enter the elements row-wise :\n");

    arr=(int **)malloc(sizeof(int*)*m);

    for(i=0;i<m;i++)
    arr[i]=(int *)malloc(sizeof(int)*n);

    for(i=0;i<m;i++)
    {
        for(j=0;j<n;j++)
        scanf("%d",&arr[i][j]);
    }

    p=(int*)malloc(sizeof(int)*(m*n));

    for(i=0;i<m;i++)
    {
        for(j=0;j<n;j++)
        p[i*n+j]=arr[i][j];
    }

    for(i=0;i<(m*n);i++)
    sum+=p[i];

    printf("The Sum \t : %d \n",sum);

    return 0;

}
