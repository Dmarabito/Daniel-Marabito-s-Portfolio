import ast
import datetime
import time
import openai
import os
import re
import json

def EvaluateCharAction(CharName="Bob",Criteria="In this story the given character was clumsy.",Story="One day bob tripped and stubbed his toe.",OpenaiKeyEnv="OPENAI_API_KEY",returnMode="simpleNumber", model="gpt-3.5-turbo", InfilePath=""):
    if InfilePath != "" :
        Infile = open(InfilePath)
        ArgFileObject = json.load(Infile)
        Infile.close()
        if ("CharName" in ArgFileObject):
            if (ArgFileObject["CharName"]!=""):
                CharName=ArgFileObject["CharName"]

        if ("Criteria" in ArgFileObject):
            if (ArgFileObject["Criteria"]!=""):
                Criteria=ArgFileObject["Criteria"]

        if ("Story" in ArgFileObject):
            if (ArgFileObject["Story"]!=""):
                Story=ArgFileObject["Story"]

        if ("OpenaiKeyEnv" in ArgFileObject):
            if (ArgFileObject["OpenaiKeyEnv"]!=""):
                OpenaiKeyEnv=ArgFileObject["OpenaiKeyEnv"]

        if ("returnMode" in ArgFileObject):
            if (ArgFileObject["returnMode"] != ""):
                returnMode = ArgFileObject["returnMode"]

        if ("model" in ArgFileObject):
            if (ArgFileObject["model"] != ""):
                model = ArgFileObject["model"]

    openai.api_key = os.getenv(OpenaiKeyEnv)
    Prompt =  [{"role":"system","content": f"""
    You will be asked to evaluate a characters actions in a story based on a criteria. 
    The character you are evaluating is '{CharName}'. 
    Evaluate this character based on the truth of the following statement : '{Criteria}'.
    The story to use for the evaluation is: '{Story}'. 
    Your evaluation should include a number in [] between 0 and 1. [0.0] being completely false while [1.0] is completely true.
    """}]
    chat = openai.chat.completions.create(model=model, messages=Prompt)
    if(returnMode == "simpleNumber" or returnMode == "number"):
        return ExtractNumber(chat.choices[0].message.content)


    #elif(returnMode == "response,Number"):
        #return [chat.choices[0].message.content,ExtractNumber(chat.choices[0].message.content)]


    elif(returnMode == "response"):
        return chat.choices[0].message.content

    elif(returnMode == "chat"):
        return chat

    #elif(returnMode == "response,Number,Useage"):
        #return [chat.choices[0].message.content,ExtractNumber(chat.choices[0].message.content),chat.usage]

    elif(len(re.findall("\[.+\]",returnMode))>0):
       RequestArray = ast.literal_eval(returnMode)
       returnArray = []
       for ReturnRequest in RequestArray:
            if (ReturnRequest.lower() == "number" or ReturnRequest.lower() == "simplenumber"):
                returnArray.append(ExtractNumber(chat.choices[0].message.content))
            if (ReturnRequest.lower() == "response"):
                returnArray.append(chat.choices[0].message.content)
            if ReturnRequest.lower() == "chat":
                returnArray.append(chat)
            if ReturnRequest.lower() == "useage" or ReturnRequest.lower() == "usage":
                returnArray.append(chat.usage)
            if ReturnRequest.lower() == "dtnow":
                returnArray.append(datetime.datetime.now())
            if ReturnRequest.lower() == "time":
                returnArray.append(time.time())
       return returnArray

def ExtractNumber(InText):
    return float(re.findall("\d+\.?\d?",re.findall("\[\d+\.?\d?\]", InText)[0])[0])

if __name__ == '__main__':
    import argparse
#    import openai
#    import os
    ParserOfArgs = argparse.ArgumentParser(description="Evaluates a characters actions based on a criteria in a given story.")

    ParserOfArgs.add_argument("-n","--name",dest="CharName", default="Bob")

    ParserOfArgs.add_argument("-c","--criteria",dest="Criteria", default="In this story the given character was clumsy.")

    ParserOfArgs.add_argument("-s","--story",dest="Story", default="One day bob tripped and stubbed his toe.")

    ParserOfArgs.add_argument("-k", "--KeyVar", dest="KeyEnviroVar",default="OPENAI_API_KEY")

    ParserOfArgs.add_argument("-rm","--returnMode",dest="returnMode",default="simpleNumber")

    ParserOfArgs.add_argument("-mod","--model",dest="model",default="gpt-3.5-turbo")

    ParserOfArgs.add_argument("-f", "--file", dest="InfilePath", default="")

    TheArgs = ParserOfArgs.parse_args()

    print(EvaluateCharAction(CharName=TheArgs.CharName,Criteria=TheArgs.Criteria,Story=TheArgs.Story,OpenaiKeyEnv=TheArgs.KeyEnviroVar,returnMode=TheArgs.returnMode, model=TheArgs.model,InfilePath=TheArgs.InfilePath))