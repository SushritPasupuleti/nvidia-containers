check:
	@sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi

check-nix-os:
	@sudo docker run --rm --device nvidia.com/gpu=all ubuntu nvidia-smi
