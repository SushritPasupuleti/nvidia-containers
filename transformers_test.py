import torch
from transformers import AutoTokenizer, AutoModelForCausalLM

def test_smollm():
    print("Checking GPU availability...")
    print("CUDA Available:", torch.cuda.is_available())

    model_name = "HuggingFaceTB/SmolLM-135M"
    print(f"\nLoading model: {model_name}")

    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForCausalLM.from_pretrained(model_name)

    device = "cuda" if torch.cuda.is_available() else "cpu"
    model.to(device)

    prompt = "AI is overhyped because "
    inputs = tokenizer(prompt, return_tensors="pt").to(device)
    outputs = model.generate(**inputs, max_new_tokens=50)

    print("\nGenerated Text:")
    print(tokenizer.decode(outputs[0], skip_special_tokens=True))

if __name__ == "__main__":
    test_smollm()

