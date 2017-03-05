
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdlib.h>
#include <stdio.h>

cudaError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addStuff(int *d_a,int *d_b,int *d_c,int n)
{
	int i=blockIdx.x*blockDim.x+ threadIdx.x;

	if(i<n)
		d_c[i]=d_a[i]+d_b[i];

	printf("%d \n",d_c[i]);


}


int main()
{

	int n,size,i;
	int *a,*b,*c,*d_a,*d_b,*d_c;

	printf("Enter the nuber of elements: \n");
	scanf("%d",&n);

	a=(int *)malloc((size=sizeof(int)*n));
	b=(int *)malloc(size);
	c=(int *)malloc(size);


	cudaMalloc((void **)&d_a,size);
	cudaMalloc((void**)&d_b,size);
	cudaMalloc((void **)&d_c,size);

	for(i=0;i<n;i++)
	{
		a[i]=i;
		b[i]=100;
	}

	cudaMemcpy(d_a,a,size,cudaMemcpyHostToDevice);
	cudaMemcpy(d_b,b,size,cudaMemcpyHostToDevice);

	addStuff<<< (int)(n/1000.0 + 1),1000>>>(d_a,d_b,d_c,n);


	cudaMemcpy(c,d_c,size,cudaMemcpyDeviceToHost);


	for(i=0;i<n;i++)
		printf("%d \n",c[i]);

	free(a);
	free(b);
	free(c);
	
	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);



	return 0;
}
