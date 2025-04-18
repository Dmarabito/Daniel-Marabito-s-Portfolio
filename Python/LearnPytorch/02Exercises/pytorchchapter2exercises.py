# -*- coding: utf-8 -*-
"""PytorchChapter2Exercises.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1qlrtggW_k59INKtIoxCj9saqtH2zo2GD
"""

! pip install torchmetrics

# import cell
import torch
from torch import nn
from sklearn.datasets import make_moons
from sklearn.model_selection import train_test_split
from torchmetrics import Accuracy
import numpy as np
import matplotlib.pyplot as plt
import math

device = "cuda" if torch.cuda.is_available() else "cpu"
print(device)

randomSeed = 42

x, y = make_moons(n_samples=1000, random_state=randomSeed)
x = torch.from_numpy(x).type(torch.float).to(device)
y = torch.from_numpy(y).type(torch.float).to(device)
print(f"x shape {x.shape}")
print(f"y shape{y.shape}")
x_train, x_test, y_train, y_test = train_test_split(x,y, train_size=0.8, random_state=randomSeed)
print(f"x_train sample {x_train[:10]}")
print(f"x_test sample {x_test[:10]}")
print(f"y_train sample {y_train[:10]}")
print(f"y_test sample {y_test[:10]}")

class moon_module(nn.Module):
  def __init__(self, hidden_units=10):
    """
    The model for sorting out our moon dataset.

    Args:
    hidden_units (int): number of hidden unit to be used.
    """
    super().__init__()
    self.InputLayer = nn.Linear(in_features=2, out_features=hidden_units)
    self.MidLayer1 = nn.Linear(in_features=hidden_units, out_features=hidden_units)
    self.MidLayer2 = nn.Linear(in_features=hidden_units, out_features=hidden_units)
    self.OutputLayer = nn.Linear(in_features=hidden_units, out_features=1)
    self.relu = nn.ReLU()
  def forward(self, x):
    return self.OutputLayer(self.MidLayer2(self.relu(self.MidLayer1(self.relu(self.InputLayer(x))))))

MoonModel = moon_module(hidden_units=20).to(device)
loss_fn = nn.BCEWithLogitsLoss()
accuarcy_fn = Accuracy(task="binary").to(device)
optimizer = torch.optim.SGD(params=MoonModel.parameters(), lr=0.1)

x_train, x_test = x_train.to(device), x_test.to(device)
y_train, y_test = y_train.to(device), y_test.to(device)
torch.manual_seed(randomSeed)
torch.cuda.manual_seed(randomSeed)

epochs = 1000

for epoch in range(epochs):
  MoonModel.train()
  training_logits = MoonModel(x_train).squeeze()
  training_preds = torch.round(torch.sigmoid(training_logits))
  loss = loss_fn(training_logits, y_train)
  training_acc = accuarcy_fn(training_preds, y_train)
  optimizer.zero_grad()
  loss.backward()
  optimizer.step()
  MoonModel.eval()
  with torch.inference_mode():
    test_logits = MoonModel(x_test).squeeze()
    test_loss = loss_fn(test_logits, y_test)
    test_preds = torch.round(torch.sigmoid(test_logits))
    test_acc = accuarcy_fn(test_preds, y_test)
  if epoch%10 == 0:
    print(f"epoch: {epoch}")
    print(f"loss: {loss:.3f}")
    print(f"training accuracy: {(training_acc*100):.2f}%")
    print(f"test loss: {test_loss:.3f}")
    print(f"test accuracy: {(test_acc*100):.2f}%")

#So here is a cell for the plot_decision_boundry method that was offered up(this cell is not my work).

# Plot the model predictions
import numpy as np

def plot_decision_boundary(model, X, y):

    # Put everything to CPU (works better with NumPy + Matplotlib)
    model.to("cpu")
    X, y = X.to("cpu"), y.to("cpu")

    # Source - https://madewithml.com/courses/foundations/neural-networks/
    # (with modifications)
    x_min, x_max = X[:, 0].min() - 0.1, X[:, 0].max() + 0.1
    y_min, y_max = X[:, 1].min() - 0.1, X[:, 1].max() + 0.1
    xx, yy = np.meshgrid(np.linspace(x_min, x_max, 101),
                         np.linspace(y_min, y_max, 101))

    # Make features
    X_to_pred_on = torch.from_numpy(np.column_stack((xx.ravel(), yy.ravel()))).float()

    # Make predictions
    model.eval()
    with torch.inference_mode():
        y_logits = model(X_to_pred_on)

    # Test for multi-class or binary and adjust logits to prediction labels
    if len(torch.unique(y)) > 2:
        y_pred = torch.softmax(y_logits, dim=1).argmax(dim=1) # mutli-class
    else:
        y_pred = torch.round(torch.sigmoid(y_logits)) # binary

    # Reshape preds and plot
    y_pred = y_pred.reshape(xx.shape).detach().numpy()
    plt.contourf(xx, yy, y_pred, cmap=plt.cm.RdYlBu, alpha=0.7)
    plt.scatter(X[:, 0], X[:, 1], c=y, s=40, cmap=plt.cm.RdYlBu)
    plt.xlim(xx.min(), xx.max())
    plt.ylim(yy.min(), yy.max())

plot_decision_boundary(MoonModel, x, y)

def tanh(x):
  return (torch.exp(x)-torch.exp(-1*x))/(torch.exp(x)+torch.exp(-x))
nnTanh = nn.Tanh()
print(tanh(x_train)[:10])
print(nnTanh(x_train)[:10])

# This code was provided should make a spiral data set
# Code for creating a spiral dataset from CS231n
import numpy as np
N = 100 # number of points per class
D = 2 # dimensionality
K = 3 # number of classes
X = np.zeros((N*K,D)) # data matrix (each row = single example)
y = np.zeros(N*K, dtype='uint8') # class labels
for j in range(K):
  ix = range(N*j,N*(j+1))
  r = np.linspace(0.0,1,N) # radius
  t = np.linspace(j*4,(j+1)*4,N) + np.random.randn(N)*0.2 # theta
  X[ix] = np.c_[r*np.sin(t), r*np.cos(t)]
  y[ix] = j
# lets visualize the data
plt.scatter(X[:, 0], X[:, 1], c=y, s=40, cmap=plt.cm.Spectral)
plt.show()

x_spiral_train, x_spiral_test, y_spiral_train, y_spiral_test = train_test_split(X, y, train_size=0.8, random_state=randomSeed)
x_spiral_train = torch.from_numpy(x_spiral_train).type(torch.float)
x_spiral_test = torch.from_numpy(x_spiral_test).type(torch.float)
y_spiral_train = torch.from_numpy(y_spiral_train).type(torch.LongTensor)
y_spiral_test = torch.from_numpy(y_spiral_test).type(torch.LongTensor)
print(f"X train shape: {x_spiral_train.shape}")
print(f"X test shape: {x_spiral_test.shape}")
print(f"y train shape: {y_spiral_train.shape}")
print(f"y test shape: {y_spiral_test.shape}")

class SpiralModule(nn.Module):
  def __init__(self, in_features, out_features, hidden_units=10):
    super().__init__()
    self.LayerStack = nn.Sequential(
        nn.Linear(in_features=in_features, out_features=hidden_units),
        nn.Tanh(),
        nn.Linear(in_features=hidden_units, out_features=hidden_units),
        nn.Tanh(),
        nn.Linear(in_features=hidden_units, out_features=hidden_units),
        nn.Tanh(),
        nn.Linear(in_features=hidden_units, out_features=hidden_units),
        nn.Tanh(),
        nn.Linear(in_features=hidden_units, out_features=hidden_units),
        nn.Tanh(),
        nn.Linear(in_features=hidden_units, out_features=hidden_units),
        nn.Tanh(),
        nn.Linear(in_features=hidden_units, out_features=out_features)
    )
  def forward(self, x):
    return self.LayerStack(x)

SpiralModel = SpiralModule(in_features=2, out_features=3, hidden_units=10).to(device)
spiral_loss_fn = nn.CrossEntropyLoss()
spiral_accuarcy_fn = Accuracy(task="multiclass", num_classes=3).to(device)
spiral_optimizer = torch.optim.Adam(params = SpiralModel.parameters(), lr=0.01)

x_spiral_train, x_spiral_test = x_spiral_train.to(device), x_spiral_test.to(device)
y_spiral_train, y_spiral_test = y_spiral_train.to(device), y_spiral_test.to(device)
torch.manual_seed(randomSeed)
torch.cuda.manual_seed(randomSeed)
spiral_epochs = 1000

for epoch in range(spiral_epochs):
  SpiralModel.train()

  spiral_train_logits = SpiralModel(x_spiral_train).squeeze()
  spiral_train_pred_probs = torch.softmax(spiral_train_logits, dim=1)
  spiral_train_preds = torch.argmax(spiral_train_pred_probs, dim=1)

  spiral_train_loss = spiral_loss_fn(spiral_train_logits, y_spiral_train)
  spiral_train_acc = spiral_accuarcy_fn(y_spiral_train, spiral_train_preds)

  spiral_optimizer.zero_grad()

  spiral_train_loss.backward()

  spiral_optimizer.step()

  SpiralModel.eval()
  with torch.inference_mode():
    spiral_test_logits = SpiralModel(x_spiral_test).squeeze()
    spiral_test_loss = spiral_loss_fn(spiral_test_logits, y_spiral_test)
    spiral_test_preds = torch.softmax(spiral_test_logits, dim=1).argmax(dim=1)
    spiral_test_acc = spiral_accuarcy_fn(spiral_test_preds, y_spiral_test)
  if (epoch%100==0):
    print(f"epoch: {epoch}")
    print(f"training loss: {spiral_train_loss:.4f}")
    print(f"training accuracy {(spiral_train_acc*100):.2f}%")
    print(f"test loss: {spiral_test_loss:.4f}")
    print(f"test accuracy: {(spiral_test_acc*100):.2f}%")

plt.figure(figsize=(12,6))
plt.title("train")
plt.subplot(1,2,1)
plot_decision_boundary(SpiralModel, x_spiral_train, y_spiral_train)
plt.title("test")
plt.subplot(1,2,2)
plot_decision_boundary(SpiralModel, x_spiral_test, y_spiral_test)