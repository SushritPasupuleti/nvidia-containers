# Nvidia Containers

Running Containers with GPU Passthrough for ML/AI workloads.

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
