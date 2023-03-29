ARG base_image=yaoyuh/u20c116:03_torch
FROM ${base_image}

RUN pip3 install --no-cache-dir \
	psutil \
	openmim
	
WORKDIR /libraries

# Refer to https://github.com/open-mmlab/mmcv/blob/master/docker/dev/Dockerfile
# for inspiration.

ENV FORCE_CUDA="1"
ENV MMCV_WITH_OPS="1"

# Refer to https://developer.nvidia.com/cuda-gpus
# For the Compute Capability of the target GPU.
# CUDA_ARCH="8.6" for RTX3080(Ti) and RTX3090(Ti)
# CUDA_ARCH="6.1" for TITAN X(p) and GTX1080(Ti)
# CUDA_ARCH="8.0" for A100
# CUDA_ARCH="7.0" for V100
# Refer to https://pytorch.org/docs/stable/cpp_extension.html#torch.utils.cpp_extension.CUDAExtension
# for how to set TORCH_CUDA_ARCH_LIST.
ARG CUDA_ARCH="6.1 7.0 8.0 8.6"
ENV TORCH_CUDA_ARCH_LIST=${CUDA_ARCH}

RUN cd /libraries \
 && git clone -b v1.7.0 --depth 1 https://github.com/open-mmlab/mmcv.git \
 && cd mmcv \
 && pip3 install . \
 && cd .. \
 && rm -rf mmcv/
	
# Entrypoint command
CMD /bin/bash
