

//#ifndef __CUDACC__
//define __CUDACC__
//#endif
#include "cuda.h"
#include "device_launch_parameters.h"
//#include "cuda_runtime.h"

//#include <device_functions.h>
#include <stdlib.h>

#include <stdio.h>
#define tile 4

__global__ void test(int *a) 
{	int i=0;
	printf("Start\n");
	for(;i<100000;i++);

	printf("2353423543");

}


int main()
{
	int *a;
	*a=1000;
	test<<<1,100>>>(a);
	printf("!!!");

	return 0;
}
