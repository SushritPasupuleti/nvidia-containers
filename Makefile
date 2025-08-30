check:
	@sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi

check-nix-os:
	@sudo docker run --rm --device nvidia.com/gpu=all ubuntu nvidia-smi

docker-build-test:
	@docker build -t pytorch-gpu-test .

docker-run:
	@docker run --rm --runtime=nvidia --gpus all -it pytorch-gpu-test

docker-run-nix-os:
	@docker run --rm --device nvidia.com/gpu=all -it pytorch-gpu-test
