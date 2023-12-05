# This is a work in progress, chatbot made for discord using chatgpt.
# For setup you need to make sure you are using the right global variables for your api keys.
# "MachinedramonGPTKey" is for the discord key. "OPENAI_API_KEY" is for the openapi key. "MachinedramonHuggingFaceKey" is for your hugging face key.
# You will also have to set the ChannelId variable to the appropriate for your setup. You will also need to make sure your permissions are correct.
# In the current version you can run it, and while it is running type messages into the discord channel that you set up with the channelId. It will then respond. If the message is too long it will split it up. I am in the progress of making it respond to audio using whisperapi to get text. I need to set up a context manager to deal with if you chat with it a bunch. I'm also considering making it able to turn images to text as well so there is a little stub to sort out image attachments. Not yet sure about what image captioning model I will use but it will likely be one from hugging face.
# The recombiner class is from a previous project.
