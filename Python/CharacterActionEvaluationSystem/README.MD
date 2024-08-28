# So this is a little program I made that takes command line input and uses chatgpt to generate an evaluation of a characters actions in a story based on a criteria and gives you a number from 0 to 1 based on how while that criteria applies.
# Obviously such a result won't be perfect, so do not use it for anything too serious. I have plans for how I will use this but for now I will keep those to myself in case they don't manifest.
# So it takes the following command line arguments :
# "-n","--name",dest="CharName", default="Bob"
# --name is the name of the character to be evaluated
#
# "-c","--criteria",dest="Criteria", default="In this story the given character was clumsy."
# --criteria is the condition to be tested.
#
# "-s","--story",dest="Story", default="One day bob tripped and stubbed his toe."
# --story is the story to be evaluated.
#
# "-k", "--KeyVar", dest="KeyEnviroVar",default="OPENAI_API_KEY"
# --KeyVar is the name of the enviromental variable in which you are storing your api key for chatgpt.
#
# "-rm","--returnMode",dest="returnMode",default="simpleNumber"
# --returnMode is a setting for how you want it to return data.
# if --returnMode is "simpleNumber" or "number" it will just send the number from 0.0 to 1.0.
# if --returnMode is "response" it will give the content of the response
# if --returnMode is "chat" it will return the chat completion object that chatgpt sends.
# in addition to this you can have --returnMode be a string containing an array. If it is an array it will return an array with the values in the order requested.
# each of the previous returns can be an item in the array. In addition to the following:
# if "useage" is in the array you will get the useage information from the chat completion.
# "dtnow" in the array will add the current datetime.
# "time" in the array will add time.time()
#
# "-mod","--model",dest="model",default="gpt-3.5-turbo"
# --model tells chatgpt what model to use.
#
# "-f", "--file", dest="InfilePath", default=""
# --file allows you to send input as a .json file by path rather than fill in every command line argument. The .json takes priority over any arguments passed.
# The following are the keys in for the .json file, they fairly directly reference the aformention arguments.
# "CharName"
# "Criteria"
# "Story"
# "OpenaiKeyEnv"
# "returnMode"
# "model"
