# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    #print_hi('PyCharm')
    import torch
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt

    print(torch.__version__)
    scalar = torch.tensor(7)
    print(scalar)
    print("A vector has ", scalar.ndim, " dimension")
    print(scalar.item())

    vector = torch.tensor([7,7])
    print(vector)
    print("A vector has ", vector.ndim, " dimension")
    print("Vector shape: ", vector.shape)

    MATRIX = torch.tensor([[7, 8],
                           [9, 10]])
    print(MATRIX)
    print("A matrix has ", MATRIX.ndim, " dimension")
    print("Shape ", MATRIX.shape)

    TENSOR = torch.tensor([[[1, 2, 3],
                            [2, 6, 9],
                            [3, 6, 4]]])
    print(TENSOR)
    print("This Tensor has ", TENSOR.ndim, " dimension")
    print(TENSOR.shape)
    print(TENSOR[0])

    PracticeTensor = torch.tensor([[
        [
        [0,1],[1,2], [1,3]
        ],
        [
            [5,6],[4,3],[2,1]
        ]
    ]])
    print("Practice Tensor has ",PracticeTensor.ndim, "dimensions")
    print("Shape of practice Tensor", PracticeTensor.shape, "My prediction is [1,1,2,3]")
    random_tensor = torch.rand(3, 4);
    print(random_tensor)
    CustomRandomTest = torch.rand(20,20,20)
    #print(CustomRandomTest)
    print(CustomRandomTest.ndim)
    print(CustomRandomTest.shape)

    zeros = torch.zeros(3, 4)
    print(zeros*random_tensor)
    ones = torch.ones(3,4)
    print(ones)
    print(ones.dtype)
    #print(random_tensor)
    one_to_ten = torch.arange(1,11)
    print(one_to_ten)
    zero_to_1000By77 = torch.arange(start=0,end=1000,step=77)
    print(zero_to_1000By77)
    ten_zeros = torch.zeros_like(input=one_to_ten)
    print(ten_zeros)

    print(one_to_ten.dtype)
    Randy10 = torch.rand_like(one_to_ten.float())
    print(Randy10)
    print(one_to_ten.dtype)

    #float_32_tensor = torch.tensor([3.0, 6.0, 9.0], dtype=None)
    #float_32_tensor = torch.tensor([3.0, 6.0, 9.0], dtype=None, device='cuda', requires_grad=False)
    #float_32_tensor = torch.tensor([3.0, 6.0, 9.0], dtype=None, device='cpu', requires_grad=False)
    float_32_tensor = torch.tensor([3.0, 6.0, 9.0], dtype=None, device=None, requires_grad=False)
    print(float_32_tensor)
    print(float_32_tensor.dtype)

    float_16_tensor = float_32_tensor.type(torch.float16)
    print(float_16_tensor.dtype)
    print(float_16_tensor)

    print(float_16_tensor*float_32_tensor)

    int_32_tensor = torch.tensor([3, 6, 9], dtype=torch.int32)
    print(int_32_tensor)

    some_tensor = torch.rand(3, 4)
    print(some_tensor)
    print(some_tensor.dtype)
    print(some_tensor.shape)
    print(some_tensor.device)

    print(f"data type of tensor: {some_tensor.dtype}")
    print(f"shape of tensor: {some_tensor.shape}")
    print(f"device of tensor: {some_tensor.device}")

    tensor = torch.tensor([1, 2, 3])
    print(tensor+10)
    print(tensor*10)
    print(tensor - 10)

    print("Element wise multiplication: ", tensor, "*", tensor, "=", (tensor * tensor))
    print(torch.matmul(tensor, tensor))

    print("Tensor Multiplication can be done with @ symbol.")
    print(tensor @ tensor)

    tensor_A = torch.tensor([[1, 2],
                             [3, 4],
                             [5, 6]])

    tensor_B = torch.tensor([[7, 10],
                             [8, 11],
                             [9, 12]])

    print(tensor_B.T)

    print("mm can be used as well for matrix multiplication: \n",torch.mm(tensor_A,tensor_B.T))

    print("or again @ symbol: \n",tensor_A @ tensor_B.T)
    x = torch.arange(0, 100, step=10)
    print(torch.min(x))
    print(x.min())

    print(torch.max(x), x.max())

    print(torch.mean(x.type(torch.float32)))

    print(x.type(torch.float32).mean())

    print(torch.sum(x), x.sum())

    print(x.argmin())

    print(x.argmax())

    x = torch.arange(1., 10.)
    print(x)

    x_reshaped = x.reshape(1, 9)
    print(x_reshaped)
    z = x.view(1,9)
    print(z)

    z[:, 0] = 5
    print(z)
    print(x)

    print("Testing a theory chatgpt purposed as to the meaning of : in the [] apparently it selects all in that dimension.")
    print(x_reshaped[:, 0])

    x_stacked = torch.stack([x, x, x, x])
    print(x_stacked)

    print(x_reshaped.shape)
    print(x_reshaped.squeeze().shape)

    print("x reshaped pre squeeze")
    print(x_reshaped)
    print(x_reshaped.shape)
    print("\n x reshaped post squeeze")
    x_squeezed = x_reshaped.squeeze()
    print(x_squeezed)
    print(x_squeezed.shape)

    print(x_squeezed)
    print(x_squeezed.shape)
    print("")

    x_unsqueezed = x_squeezed.unsqueeze(dim=0)
    print(x_unsqueezed)
    print(x_unsqueezed.shape)

    x_original = torch.rand(size=(224, 224, 3))  # height, width, color channel
    # we swap to color channel first
    x_permuted = torch.permute(x_original, dims=(2, 0, 1))
    print(x_permuted.shape)

    x = torch.arange(1, 10).reshape(1, 3, 3)
    print(x)
    print(x.shape)
    print(x[0])
    print("\n", x[0][0])
    print("\n", x[0, 0])

    print(x[0, 0, 0])

    print(x[0, 0, 0])
    print(x[0, 2, 2])

    print("Get all values of 0th dimension, and of 1st dimension, but only get the 1st element of the 2nd dimension")
    print(x[:, :, 1])

    array = np.arange(1.0, 8.0)
    tensor = torch.from_numpy(array).type(torch.float32)
    print(array)
    print(tensor)

    tensor = torch.ones(7)
    numpyTensor = tensor.numpy()
    print(tensor)
    print(numpyTensor)

    Random_Tensor_A = torch.rand(3, 4)
    Random_Tensor_B = torch.rand(3, 4)
    print(Random_Tensor_A)
    print()
    print(Random_Tensor_B)
    print()
    print(Random_Tensor_A == Random_Tensor_B)

    RANDOM_SEED = 42
    print(int.from_bytes("Magic".encode('utf-8'), byteorder='big', signed=False)) #looked up how to convert strings to ints so I can use strings for this.
    torch.manual_seed(RANDOM_SEED)

    print(torch.cuda.is_available())

    device = "cuda" if torch.cuda.is_available() else "cpu"
    print(device)
    print(torch.cuda.device_count())

    tensor = torch.tensor([1, 2, 3])
    tensor_on_gpu = tensor.to(device)
    print(tensor_on_gpu.device)

    tensor_on_cpu = tensor_on_gpu.to("cpu")
    print(tensor_on_cpu.device)

    # Moving back to cpu
    tensor_on_cpu = tensor_on_gpu.to("cpu")
    print(tensor_on_cpu.device)

    ArrayVersionOfTensor = tensor_on_gpu.cpu().numpy()
    print(ArrayVersionOfTensor)
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
