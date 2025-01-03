# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    import torch
    from torch import nn
    import matplotlib.pyplot as plt
    import numpy as np
    from pathlib import Path
    what_were_covering = {1: "prepare data",
                          2: "build model",
                          3: "fit our model to the data (training)",
                          4: "making predicitions and evaluating them (inference)",
                          5: "Save and load a model",
                          6: "Putting it all together"
                          }
    print(what_were_covering)
    print(torch.__version__)

    weight = 0.7
    bias =  0.3
    start = 0
    end = 1
    step = 0.02
    X = torch.arange(start,end,step).unsqueeze(dim=1)
    y = weight * X + bias
    print(X[:10])
    print(y[:10])
    print(len(X))
    print(len(y))

    train_split = int(0.8*len(X))
    print(train_split)


    x_train = X[:train_split]
    y_train = y[:train_split]
    x_test = X[train_split:]
    y_test =y[train_split:]
    print(len(x_train))
    print(len(y_train))
    print(len(x_test))
    print(len(y_test))

    def plot_predictions(train_data=x_train, train_labels=y_train, test_data=x_test, test_labels=y_test, predicitions=None, Show_plt=True):
       plt.figure(figsize=(10, 7))
       plt.scatter(train_data, train_labels, c="b",s=4, label="training data")
       plt.scatter(test_data, test_labels, c="g", s=4, label="Testing data")
       if predicitions is not None:
        plt.scatter(test_data, predicitions, c="r", s=4, label="Predictions")
       plt.legend(prop={"size": 14})
       if(Show_plt):
        plt.show()


    plot_predictions(Show_plt=False)


class LinearRegressionModel(nn.Module):
  def __init__(self):
    super().__init__()
    self.weights = nn.Parameter(torch.randn(1, requires_grad=True, dtype=torch.float))
    self.bias =  nn.Parameter(torch.randn(1, requires_grad=True, dtype=torch.float))
  def forward(self, x : torch.Tensor) -> torch.Tensor :
    return self.weights * x + self.bias

torch.manual_seed(42)
model_0 = LinearRegressionModel()
print(list(model_0.parameters()))

print(model_0.state_dict())

with torch.inference_mode():
  y_preds = model_0(x_test)

print(y_preds)

plot_predictions(predicitions=y_preds, Show_plt=False) #remove plot for later

print(model_0.state_dict())

loss_fn = nn.L1Loss()
optimizer = torch.optim.SGD(params=model_0.parameters(),lr=0.01)
print(loss_fn)

epoch_count = []
loss_values = []
test_loss_values = []

epochs = 1000
for epoch in range(epochs):
    model_0.train

    # forward pass
    y_pred = model_0(x_train)

    # loss function
    loss = loss_fn(y_pred, y_train)

    # optimizder zero grad
    optimizer.zero_grad()

    # backpropogation
    loss.backward()

    # gradient descent
    optimizer.step()

  #testing
    model_0.eval()
    with torch.inference_mode():
        test_pred = model_0(x_test)
        test_loss = loss_fn(test_pred,y_test)

    if(epoch%10==0):
        print(f"epoch:{epoch} | Loss: {loss} | test loss: {test_loss}")
        epoch_count.append(epoch)
        loss_values.append(loss)
        test_loss_values.append(test_loss)

print("Target weight: ",weight, "Target Bias: ",bias)
model_0.state_dict()

with torch.inference_mode():
  y_pres_new = model_0(x_test)

plot_predictions(predicitions=y_pres_new,Show_plt=True)

plt.plot(epoch_count, np.array(torch.tensor(loss_values).cpu().numpy()), label="Train Loss")
plt.plot(epoch_count, test_loss_values, label="Test loss")
plt.title("training and test loss curves")
plt.show()

MODEL_PATH = Path("models")
MODEL_PATH.mkdir(parents=True, exist_ok=True)
MODEL_NAME = "_01_pytorch_workflow_model_0.pth"
MODEL_SAVE_PATH = MODEL_PATH / MODEL_NAME
print(MODEL_SAVE_PATH)
torch.save(obj=model_0.state_dict(), f=MODEL_SAVE_PATH)

loaded_model_0 = LinearRegressionModel()
loaded_model_0.load_state_dict(torch.load(f=MODEL_SAVE_PATH))

loaded_model_0.eval()
with torch.inference_mode():
    loaded_model_preds = loaded_model_0(x_test)
plot_predictions(predicitions=loaded_model_preds, Show_plt=True)

weight = 0.7
bias = 0.3
start = 0
end = 1
step = 0.02
x = torch.arange(start, end, step).unsqueeze(dim=1)
y = weight*x + bias
print(x[:10])
print(y[:10])

device = "cuda" if torch.cuda.is_available() else "cpu"

#Prepare Data
#--create data
weight = 0.7
bias = 0.3
start = 0
end = 1
step = 0.02
x = torch.arange(start, end, step).unsqueeze(dim=1)
y = weight*x + bias
print(x[:10])
print(y[:10])

#--split data
train_split = int(0.8*len(x))
x_train = x[:train_split]
y_train = y[:train_split]
x_test = x[train_split:]
y_test = y[train_split:]
print(f"x train length: {len(x_train)}")
print(f"y train length: {len(y_train)}")
print(f"x test length: {len(x_test)}")
print(f"y test length: {len(y_test)}")
plot_predictions(x_train, y_train, x_test, y_test)

#Building model
# - make class
class LinearRegression2(nn.Module):
  def __init__(self):
    super().__init__()
    self.linear_layer = nn.Linear(in_features=1,out_features=1)
    # so we decided to use layers instead
    #self.weights = nn.Parameter(torch.randn(1, requires_grad=True, dtype=torch.flot))
    #self.bias = nn.Parameter(torch.randn(1, requires_grad=True, dtype=torch.float))

  def forward(self, x : torch.Tensor) -> torch.Tensor:
    return self.linear_layer(x)
    #because we changed to use linear layers this changes
    #return self.weights *x + self.bias

torch.manual_seed(42)
Model_1 = LinearRegression2()
print("Model_1 state dictionary \n",Model_1.state_dict())

print(next(Model_1.parameters()).device)
Model_1.to(device=device)
print(next(Model_1.parameters()).device)

#-select loss function
loss_fn = nn.L1Loss()
# - make optimizer
optimizer = torch.optim.SGD(params=Model_1.parameters(), lr=0.01)


#training loop
torch.manual_seed(42)
epochs = 200
x_train = x_train.to(device=device)
y_train = y_train.to(device=device)
x_test = x_test.to(device=device)
y_test = y_test.to(device=device)
#Model_1.to(device=device)

for epoch in range(epochs):
  Model_1.train()
  y_pred = Model_1(x_train)
  loss = loss_fn(y_pred, y_train)
  optimizer.zero_grad()
  loss.backward()
  optimizer.step()
  Model_1.eval()
  with torch.inference_mode():
    test_pred = Model_1(x_test)
    test_loss = loss_fn(test_pred,y_test)
  if(epoch%10==0):
    print(f"epoch: {epoch}, loss: {loss}, test loss: {test_loss}")
#making predicts and evaluating(testing loop)
Model_1.eval()
with torch.inference_mode():
  y_preds = Model_1(x_test)
print(f"y_preds \n{y_preds}")
plot_predictions(predicitions=y_preds.cpu())

#Save and load model
#from pathlib import Path
#-save
MODEL_PATH = Path("models")
MODEL_PATH.mkdir(parents=True, exist_ok=True)
MODEL_NAME = "01_pytorch_workflow_model_1.pth"
MODEL_SAVE_PATH = MODEL_PATH / MODEL_NAME
print(f"Saving model state dict to: {MODEL_PATH}")
torch.save(obj=Model_1.state_dict(), f=MODEL_SAVE_PATH)
#-load
loaded_model_1 = LinearRegression2()
loaded_model_1.load_state_dict(torch.load(MODEL_SAVE_PATH))
loaded_model_1.to(device=device)

#evaluate the loaded model
loaded_model_1.eval()
with torch.inference_mode():
  loaded_model_1_preds = Model_1(x_test)
print(y_preds == loaded_model_1_preds)

#plt.show() #Commented to prevent from opening

# with torch.no_grad():
#   y_preds = model_0(x_test)
#
# plot_predictions(predicitions=y_preds, Show_plt=True)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
