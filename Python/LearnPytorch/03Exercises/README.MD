<p>Here are the exercise section for the torchvision section.</p>

<p>
What are 3 areas in industry where computer vision is currently being used?</br>
Self driving cars, Chip quality control, object detection.</br>
Search "what is overfitting in machine learning" and write down a sentence about what you find.</br>
It is where a model memorizes the data so well that is doesn’t do well in response to new data.</br>
Search "ways to prevent overfitting in machine learning", write down 3 of the things you find and a sentence about each. Note: there are lots of these, so don't worry too much about all of them, just pick 3 and start with those.</br>
So here is my source for this <a href='https://aws.amazon.com/what-is/overfitting/'>https://aws.amazon.com/what-is/overfitting/</a></br>
Data augmentation which is changing the data slightly each time the ai looks at it so that the noise can’t be learned.</br>
Ensembling is using multiple machine learning models to make a prediction.</br>
Pruning is removing less important parameters from a model.</br>
[complete] Spend 20-minutes reading and clicking through the CNN Explainer website.</br>
Upload your own example image using the "upload" button and see what happens in each layer of a CNN as your image passes through it.</br>
Load the torchvision.datasets.MNIST() train and test datasets. [complete]</br>
Visualize at least 5 different samples of the MNIST training dataset. [complete]</br>
Turn the MNIST train and test datasets into dataloaders using torch.utils.data.DataLoader, set the batch_size=32. [complete]</br>
Recreate model_2 used in this notebook (the same model from the CNN Explainer website, also known as TinyVGG) capable of fitting on the MNIST dataset. [complete]</br>
Train the model you built in exercise 8. on CPU and GPU and see how long it takes on each. [complete]</br>
Make predictions using your trained model and visualize at least 5 of them comparing the prediction to the target label. [complete]</br>
Plot a confusion matrix comparing your model's predictions to the truth labels.[complete]</br>
Create a random tensor of shape [1, 3, 64, 64] and pass it through a nn.Conv2d() layer with various hyperparameter settings (these can be any settings you choose), what do you notice if the kernel_size parameter goes up and down?</br>
As kernel size increases the 2nd and 3rd dimension decreases. In the specific situation I tried it decreased in size by 1 per increase in kernel_size.</br>
Use a model similar to the trained model_2 from this notebook to make predictions on the test torchvision.datasets.FashionMNIST dataset.</br>
Then plot some predictions where the model was wrong alongside what the label of the image should've been.</br>
After visualizing these predictions do you think it's more of a modelling error or a data error?</br>
As in, could the model do better or are the labels of the data too close to each other (e.g. a "Shirt" label is too close to "T-shirt/top")?</br>
So I believe it is a data problem that some of the labels are not that useful of a distinction. The example of the difference between a shirt and a T-shirt/top is a very clear example of it. The confusion matrix shows there is confusion there quite clearly, as well a lot of what I would call top clothing being mistaken for a shirt.</br>
</p>
