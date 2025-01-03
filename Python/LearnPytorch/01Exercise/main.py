# This is a sample Python script.
import torch
from torch import nn
import numpy as np
import matplotlib.pyplot as plot
from pathlib import Path
# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

class LinearRegression(nn.Module):
    def __init__(self):
        super().__init__()
        self.layer = nn.Linear(in_features=1, out_features=1)
    def forward(self, x:torch.Tensor) -> torch.Tensor:
        return self.layer(x)

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    device = "cuda" if torch.cuda.is_available() else "cpu"
    TargetWeight = 0.3
    TargetBias = 0.9
    start = 0
    end = 1
    step = 0.01
    InitialDataSetX = torch.arange(start, end, step,device=device).unsqueeze(1)
    InitialDataSetY = InitialDataSetX*TargetWeight + TargetBias
    print(InitialDataSetX)
    print(InitialDataSetY)
    plot.plot(InitialDataSetX.cpu(),InitialDataSetY.cpu())
    plot.show()

    TrainSplit = int(0.8*len(InitialDataSetX))
    Trainx = InitialDataSetX[:TrainSplit]
    Testx = InitialDataSetX[TrainSplit:]
    Trainy = InitialDataSetY[:TrainSplit]
    Testy = InitialDataSetY[TrainSplit:]
    plot.plot(Trainx.cpu(),Trainy.cpu())
    plot.plot(Testx.cpu(),Testy.cpu())
    plot.show()

    torch.manual_seed(5336)
    ExerciseModel01 = LinearRegression()
    print(ExerciseModel01.state_dict())

    lossfn = nn.L1Loss()
    optimizer = torch.optim.SGD(params=ExerciseModel01.parameters(),lr=0.01)

    #train
    Trainx.to(device=device)
    Trainy.to(device=device)
    Testx.to(device=device)
    Testy.to(device=device)
    ExerciseModel01.to(device=device)
    epochs = 300
    for epoch in range(epochs):
        ExerciseModel01.train()
        #forward pass
        Train_Predictions = ExerciseModel01(Trainx)

        #caluculate the loss
        loss = lossfn(Train_Predictions, Trainy)

        #Zero grad
        optimizer.zero_grad()

        #backwards
        loss.backward()

        #step
        optimizer.step()
        if (epoch%20==0):
            ExerciseModel01.eval()
            with torch.inference_mode():
                test_Predictions = ExerciseModel01(Testx)
                testLoss = lossfn(test_Predictions, Testy)
                print(f"Epoch: {epoch},train loss: {loss}, test loss: {testLoss}")
                print(ExerciseModel01.state_dict())

    ExerciseModel01.eval()
    with torch.inference_mode():
        FinalPredictions = ExerciseModel01(Testx)
        plot.plot(Trainx.cpu(),Trainy.cpu())
        plot.plot(Testx.cpu(),FinalPredictions.cpu())
        plot.show()

    ModelPath = Path("Models")
    ModelPath.mkdir(exist_ok=True)
    fileName = "ExerciseModel01.pth"
    FilePath = ModelPath / fileName
    torch.save(obj=ExerciseModel01.state_dict(),f=FilePath)

    LoadedModel =LinearRegression()
    LoadedModel.load_state_dict(torch.load(f=FilePath))
    LoadedModel.to(device=device)

    LoadedModel.eval()
    with torch.inference_mode():
        LoadedPredictions = LoadedModel(Testx)
        print(FinalPredictions == LoadedPredictions)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
