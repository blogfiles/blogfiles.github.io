#https://docs.nvidia.com/cuda/wsl-user-guide/index.html
#https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html
#https://forums.developer.nvidia.com/t/guide-to-run-cuda-wsl-docker-with-latest-versions-21382-windows-build-470-14-nvidia/178365/5
#https://github.com/NVIDIA/nvidia-container-toolkit
#https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

docker --version
docker run --env NVIDIA_DISABLE_REQUIRE=1 --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody
# Ensure cuda enabled in ubuntu machine
nvidia-smi
# Endure its visible to containers
docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
#My direct command 
./t-rex -a kawpow -o kp.unmineable.com:3333 -u DOGE:DFmsWrJ32Z4DxT9svLharH3PFpmPowvknK.p620 -p x
# my Docker command
docker run -d --name='trex-miner' -p '4067:4067/tcp' -e ALGO=kawpow -e SERVER=kp.unmineable.com:3333 -e WORKER=P620 -e WALLET=DOGE:DFmsWrJ32Z4DxT9svLharH3PFpmPowvknK.p620 --gpus all ptrfrll/nv-docker-trex:cuda11
docker run -d --name='trex-miner-etchash' -p '4067:4067/tcp' -e ALGO=etchash -e SERVER=etchash.unmineable.com:3333 -e WORKER=P620 -e WALLET=DOGE:DFmsWrJ32Z4DxT9svLharH3PFpmPowvknK.p620 --gpus all ptrfrll/nv-docker-trex:cuda11

#org samplg
docker run -d --name='trex-miner' -p '4067:4067/tcp' -e ALGO=ethash -e SERVER=stratum+ssl://us2.ethermine.org:5555 -e WORKER=Rig -e WALLET=(myethaddress) --runtime=nvidia ptrfrll/nv-docker-trex

docker run -d --name='trex-miner' -p '4067:4067/tcp' -e ALGO=ethash -e SERVER=stratum+ssl://eu1.ethermine.org:5555 -e WORKER=rig -e WALLET=(myethaddress) --gpus all --env NVIDIA_DISABLE_REQUIRE=1 ptrfrll/nv-docker-trex:cuda11
