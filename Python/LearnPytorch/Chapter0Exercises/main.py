# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    import torch
    import numpy as np

    Randy7 = torch.rand(7,7)
    print("A random 7,7 tensor")
    print(Randy7)

    Ralph7 = torch.rand(1,7)
    print("A random 1,7 tensor")
    print(Ralph7)

    Multiplied = torch.matmul(Randy7,Ralph7.T)
    print("\nMultiplied tensor")
    print (Multiplied)

    print("Set seed to 0")
    SEED = 0
    torch.manual_seed(SEED)
    RandyB7 = torch.rand(7,7)

    torch.manual_seed(SEED)
    RalphB7 = torch.rand(1,7)

    RalphRandBeta = torch.mm(RandyB7,RalphB7.T)
    print("\n Two seeded tensors matrix multiplied.")
    print(RalphRandBeta)
    print("Setting the gpu seed")
    torch.cuda.manual_seed(1234)

    torch.manual_seed(1234)
    PossibleGpuTensorA = torch.rand(2, 3)

    torch.manual_seed(1234)
    PossibleGpuTensorB = torch.rand(2, 3)

    if (torch.cuda.is_available()):
        PossibleGpuTensorA = PossibleGpuTensorA.to("cuda")
        PossibleGpuTensorB = PossibleGpuTensorA.to("cuda")
        print(PossibleGpuTensorA.device)
        print(PossibleGpuTensorB.device)

    print("Tensor multiplication of those created")
    possibleGpuMult = torch.mm(PossibleGpuTensorA,PossibleGpuTensorB.T)
    print(possibleGpuMult)
    print("\nMax and min value for the above")
    print(possibleGpuMult.max())
    print(possibleGpuMult.min())
    print("index for max and min")
    print(torch.argmax(possibleGpuMult))
    print(torch.argmin(possibleGpuMult))

    print("Presqueeze tensor")
    torch.manual_seed(7)
    LastTPreSqueeze = torch.rand(1, 1, 1, 10)
    print(LastTPreSqueeze)
    print(LastTPreSqueeze.shape)
    print("Post Squeeze")
    LastTPostSqueeze = LastTPreSqueeze.squeeze()
    print(LastTPostSqueeze)
    print(LastTPostSqueeze.shape)

    #print("The 1,7 transposed to be a 7,1")
    #print(Ralph7.T.shape)


# See PyCharm help at https://www.jetbrains.com/help/pycharm/
