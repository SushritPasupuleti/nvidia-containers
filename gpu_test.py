import torch

def check_gpu():
    print("Checking GPU availability with PyTorch...\n")

    cuda_available = torch.cuda.is_available()
    print(f"CUDA Available: {cuda_available}")

    if cuda_available:
        device_count = torch.cuda.device_count()
        print(f"Number of CUDA Devices: {device_count}")
        for i in range(device_count):
            device_name = torch.cuda.get_device_name(i)
            print(f"Device {i}: {device_name}")
    else:
        print("No GPU detected. PyTorch will use CPU.")

if __name__ == "__main__":
    check_gpu()

