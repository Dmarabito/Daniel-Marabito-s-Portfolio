<p>
So I did the exercises for chapter 2.
It involves making a binary classification model for sci-kit's make moons method.
On the multiclass classification side it involves using some provided code to generate data points from a spiral, and then making a multiclass classification model based off it.
there was also a middle part where we made a function for tanh.
So the exercises didn't explicitly state it but I took the presence of this function being made as a subtle hint that tanh would work wonders for a non-linear function to use in the spiral model. So I used it in place of relu.
Turns out I was right it worked just fine.
</p>
<p>I decided to include some screenshots of the graphs.</p>
<p>Moon graph</p>
<img src="https://raw.githubusercontent.com/Dmarabito/Daniel-Marabito-s-Portfolio/refs/heads/main/Python/LearnPytorch/02Exercises/MoonGraphs.PNG" alt="moon graph">

<p>spiral graph</p>
<img src="https://raw.githubusercontent.com/Dmarabito/Daniel-Marabito-s-Portfolio/refs/heads/main/Python/LearnPytorch/02Exercises/SpiralGraphs.PNG" alt="spiral graph">
<p>Also disclosure the plot_decision_boundary method was provided by the video's author.</p>
