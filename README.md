# Nvidia Containers

Running Containers with GPU Passthrough for ML/AI workloads.

What's here?

- `Dockerfiles` to test for GPU support with PyTorch and HuggingFace Transformers.

> Most commands used are setup in the [Makefile](./Makefile) for convenience.

## Prerequisites

- A machine with an NVIDIA GPU (so, stable income)

### Check if GPU is detected

```bash
nvidia-smi
```

If you see a table with GPU information, you're good to go!

Otherwise, suffer through the pain of installing NVIDIA drivers for your GPU. Or just switch to [NixOS](https://nixos.org/) which handles this for you.

To check if your Docker installation can see the GPU, run:

```bash
sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
```

For `NixOS` users, you might need to enable the `nvidia-container-runtime` in your Docker configuration. and change the command to:

```bash
sudo docker run --rm --device nvidia.com/gpu=all ubuntu nvidia-smi
```

If you see the same table as before, you're all set!

## Running Container to Check PyTorch with GPU

You can use the provided `Makefile` to run a container that checks if PyTorch can access the GPU.

```bash
make docker-run # or make docker-run-nix for NixOS users
```

You should see output indicating that PyTorch is using the GPU.

```
CUDA Available: True
Device: NVIDIA GeForce GTX 1080 Ti
```

## Images available

- [`Dockerfile`](./Dockerfile): Basic image with PyTorch using NVIDIA's CUDA base image.
- [`transformers.Dockerfile`](./transformers.Dockerfile): Extends the basic image to include HuggingFace Transformers
- [`customNvidia.Dockerfile`](./customNvidia.Dockerfile): Custom image with specific versions of CUDA. Uses Ubuntu as base image.

Test scripts are included in the images to verify GPU access.

- `test_pytorch.py`: Checks if PyTorch can access the GPU.
- `test_transformers.py`: Checks if HuggingFace Transformers can access the GPU.
