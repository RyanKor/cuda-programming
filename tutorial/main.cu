#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void helloCUDA(void)
{
    printf("Hello CUDA from GPU!\n");
}

int main(void)
{
    printf("Hello GPU from CPU!\n");

    // GPU 커널 호출
    helloCUDA<<<1, 10>>>();

    // GPU 작업 동기화
    cudaDeviceSynchronize();

    // CUDA 커널 실행 에러 확인
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess)
    {
        printf("CUDA kernel launch error: %s\n", cudaGetErrorString(err));
    }

    return 0;
}
