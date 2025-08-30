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

docker-build-test-transformers:
	@docker build -t gpu-test-transformers -f transformers.Dockerfile .

docker-run-transformers:
	@docker run --rm --runtime=nvidia --gpus all -it gpu-test-transformers

docker-run-transformers-nix-os:
	@docker run --rm --device nvidia.com/gpu=all -it gpu-test-transformers
