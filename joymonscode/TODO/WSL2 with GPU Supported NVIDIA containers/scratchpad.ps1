#https://docs.nvidia.com/cuda/wsl-user-guide/index.html
#https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html
#https://forums.developer.nvidia.com/t/guide-to-run-cuda-wsl-docker-with-latest-versions-21382-windows-build-470-14-nvidia/178365/5
#https://github.com/NVIDIA/nvidia-container-toolkit
#https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

docker --version
docker run --env NVIDIA_DISABLE_REQUIRE=1 --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody
docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
docker run --gpus all --rm debian:10-slim nvidia-smis