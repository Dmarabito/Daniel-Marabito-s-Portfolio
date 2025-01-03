<p>
Chapter 1 had some exercises. So I did them.<br/>
Here is a copy of the requirements for those exercises:<br/>
Create a straight line dataset using the linear regression formula (weight * X + bias).<br/>
Set weight=0.3 and bias=0.9 there should be at least 100 datapoints total.<br/>
Split the data into 80% training, 20% testing.<br/>
Plot the training and testing data so it becomes visual.<br/>
Build a PyTorch model by subclassing nn.Module.<br/>
Inside should be a randomly initialized nn.Parameter() with requires_grad=True, one for weights and one for bias.<br/>
Implement the forward() method to compute the linear regression function you used to create the dataset in 1.<br/>
Once you've constructed the model, make an instance of it and check its state_dict().<br/>
Note: If you'd like to use nn.Linear() instead of nn.Parameter() you can.<br/>
Create a loss function and optimizer using nn.L1Loss() and torch.optim.SGD(params, lr) respectively.<br/>
Set the learning rate of the optimizer to be 0.01 and the parameters to optimize should be the model parameters from the model you created in 2.<br/>
Write a training loop to perform the appropriate training steps for 300 epochs.<br/>
The training loop should test the model on the test dataset every 20 epochs.<br/>
Make predictions with the trained model on the test data.<br/>
Visualize these predictions against the original training and testing data (note: you may need to make sure the predictions are not on the GPU if you want to use non-CUDA-enabled libraries such as matplotlib to plot).<br/>
Save your trained model's state_dict() to file.<br/>
Create a new instance of your model class you made in 2. and load in the state_dict() you just saved to it.<br/>
Perform predictions on your test data with the loaded model and confirm they match the original model predictions from 4.<br/>
</p>
