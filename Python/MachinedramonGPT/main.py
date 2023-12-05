# This is a sample Python script.
import openai
import os
import discord
import json
import requests
from Recombiner import Recombiner

DiscordIntents = discord.Intents.default()
DiscordIntents.message_content = True

MachinedramonClient = discord.Client(intents=DiscordIntents)

MachinedramonMemory = []

ChannelId = 1158044948516573266




# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

def SetupApiKeys():
    SetupOpenAi()
    SetupDiscord()
    SetupHuggingFaceKey()

def SetupDiscord():
    MachinedramonClient.run(os.getenv("MachinedramonGPTKey"))

def SetupOpenAi():
    openai.api_key = os.getenv("OPENAI_API_KEY")
    #print(openai.Model.list())

def SetupHuggingFaceKey():
    return os.getenv("MachinedramonHuggingFaceKey")

def ChatSendToOpenAi(History):
    Chat = openai.ChatCompletion.create(model="gpt-3.5-turbo",messages=History)
    return (Chat['choices'][0]['message']['content'])

def MachinedramonMemoryIntialization():
    MachinedramonMemory.append({"role":"system","content":
    """
    You will be playing the role of Machinedramon.
    Machinedramon is ruthless and formidable.
    You are currently incarcerated in a prison called Fortress Impregnable.
    Fortress Impregnable is a prison for interplanar criminals.
    The user is Duke. Duke is a cleric to Machinedramon. You are talking to Duke through his digivice.
    Through your connection with duke you grant him the ability to summon commandramons. Otherwise duke doesn't have other abilities.
    Recently several prisoners have escaped from fortress Impregnable.
    You have made a deal with the prison. The deal is that if Duke uses your power to capture the prisoners then you will be free.
    """})
    MachinedramonMemory.append({"role":"user","content":"What would you like me to do?"})

def AddToMemory(Message,Role):
    # Reminder roles are "system", "user", and "assistant".
    MachinedramonMemory.append({"role": Role, "content": Message})

async def SetMemoryToMessages():
    MachinedramonMemory.clear()
    MachinedramonMemoryIntialization()
    async for Message in MachinedramonClient.get_channel(ChannelId).history(oldest_first=True):
        if (Message.author == MachinedramonClient.user):
            AddToMemory(Message.content,"assistant")
        else:
            AddToMemory(Message.content,"user")
        # Reminder you have to now uncomment the above and make it put messages in memory

@MachinedramonClient.event
async def on_ready():
    print(f'We have logged in as {MachinedramonClient.user}')
    MachinedramonMemoryIntialization()
    #AddToMemory("Macninedramon, I think are signal is being jammed.", "user")
    print(ChatSendToOpenAi(MachinedramonMemory))


@MachinedramonClient.event
async def on_message(NewMessage):
    print(len(NewMessage.attachments))
    if (NewMessage.author == MachinedramonClient.user or NewMessage.channel.id != ChannelId):
        return
    else:
        # should add an if here to check if data is text or content
        if(len(NewMessage.attachments)>0):
           for Attachment in NewMessage.attachments:
               if ("image" in Attachment.content_type):
                   print("Is Image")
               elif("audio" in Attachment.content_type):
                   print("Is Audio")
                   await AudioToText(Attachment)
                   #Returns text, need to do something with it.
               else:
                    print(Attachment.content_type)
        await SetMemoryToMessages()
        AddToMemory(NewMessage.content,"user")
        Response = ChatSendToOpenAi(MachinedramonMemory)
        if len(Response) > 2000:
            print("Long Response")
            await LongResponseHandler(Response, NewMessage)
        else:
            await NewMessage.channel.send(Response)

async def LongResponseHandler(Response, NewMessage):
    Rec = Recombiner(Response)
    for ResponseSegment in Rec.splitArray:
        await NewMessage.channel.send(ResponseSegment)

async def AudioToText(AudioAttachment):
    print("Getting Audio")
    HuggingAPIToken = SetupHuggingFaceKey()
    header = {"Authorization": f"Bearer "+HuggingAPIToken}
    url = "https://api-inference.huggingface.co/models/openai/whisper-large-v3"
    try:
        #FileDownload = await AudioAttachment.read(use_cached=True)
        data = await AudioAttachment.read(use_cached=True)
        #with open(FileDownload, "rb") as File:
            #data = File.read()
        response = (requests.request("POST", url, headers=header, data=data)).content
        text = json.loads(response)['text']
        return text
    except discord.HTTPException:
        print("Http exception")
    except discord.Forbidden:
        print("Forbidden")
    except discord.NotFound:
        print("File Not found.")
"""
def LongResponseHandler(Response):
    LengthLimit = 2000
    StartOfSubstring = 0
    PotentialSubstring = ""
    PotentialSubstringIndex = 0
    while (StartOfSubstring < len(Response)):
        for i in range(len(Response)):
            if Response[i] == "." or Response[i] == "?" or Response[i] == "!":
                PotentialSubstring = Response[StartOfSubstring:i+1]
                PotentialSubstringIndex = i
            # think this over some
"""
# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    SetupApiKeys()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
