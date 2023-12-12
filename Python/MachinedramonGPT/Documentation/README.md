<h> Foreword: I am going to try to make some more detail documentation of things here. 
<br> --- Classes --- 
<br> Main 
<br> Recombiner 
<br><br> Main Functions
<br><br> if __name__ == '__main__'
<br> This is the starting function just fires off SetupApiKeys()
<br><br> SetupApiKeys()
<br> This runs 3 methods SetupOpenAi(), SetupDiscord(), SetupHuggingFaceKey(). The tldr for these 3 functions is they set up the api key for their respective services. The discord one actually runs the client as part of it.
<br><br> SetupOpenAi()
<br> Sets the api key using "OPENAI_API_KEY" enviroment variable.
<br><br> SetupDiscord()
<br> runs the discord client which is called MachinedramonClient, using the api key gotten from the "MachinedramonGPTKey" enviroment variable.


</h>
