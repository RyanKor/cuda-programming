# nvidia-smi cuda version <-> nvcc cuda version 불일치 에러

## 상세 로그

```
CUDA kernel launch error: the provided PTX was compiled with an unsupported toolchain.
```

- 해당 에러 로그는 nvcc 사용 시점에 설치한 쿠다 버전과 nvidia-smi 드라이버 사용하는 과정에 호출하는 드라이버 버전이 달라 발생하는 문제임.

## 해결 방법

- nviaid-smi 드라이버 또는 nvcc(cuda-toolkit) 중 하나의 버전을 맞춰줘야함.

- 나의 경우, 드라이버 버전에 nvcc 버전을 맞춤.

## 해결 상세

### 해결 전 nvcc 버전

```
# ~/.bashrc
# NVCC CUDA Toolkit Path (cuda 12.6)
export CUDA_HOME=/usr/local/cuda-12.6
export PATH=/usr/local/cuda-12.6/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64:$LD_LIBRARY_PATH

localhost:/mnt/nvme/Workspace$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Thu_Sep_12_02:18:05_PDT_2024
Cuda compilation tools, release 12.6, V12.6.77
Build cuda_12.6.r12.6/compiler.34841621_0
```


### 해결된 이후 nvcc 버전
```
# ~/.bashrc
# NVCC CUDA Toolkit Path (cuda 12.4)
export CUDA_HOME=/usr/local/cuda-12.4
export PATH=/usr/local/cuda-12.4/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64:$LD_LIBRARY_PATH

localhost:/mnt/nvme/Workspace/cuda-programming$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2024 NVIDIA Corporation
Built on Thu_Mar_28_02:18:24_PDT_2024
Cuda compilation tools, release 12.4, V12.4.131
Build cuda_12.4.r12.4/compiler.34097967_0
```

## 실행 결과

```
localhost:/mnt/nvme/Workspace/cuda-programming$ ./hello 
Hello GPU from CPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
Hello CUDA from GPU!
```