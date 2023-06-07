```
# Chatbot Interface using OpenAI's chatGPT

import openai

openai.api_key = "YOUR_API_KEY"

def get_completion(prompt, model):
    """
    This method takes a prompt and a model as input and returns a response from chatGPT. 
    The messages variable is a list of dictionaries that contains the prompt. 
    The openai.ChatCompletion.create method is used to create a chat completion with the specified model and messages. 
    The temperature parameter is set to 0, which means that the response will be deterministic. 
    The function returns the content of the first choice in the response.
    """
    messages = [{"text": prompt}]
    response = openai.ChatCompletion.create(
        engine=model,
        prompt=prompt,
        temperature=0,
        max_tokens=100,
        n=1,
        stop=None,
        frequency_penalty=0,
        presence_penalty=0
    )
    return response.choices[0].text

print(get_completion("Hello, how are you?", "chatGPT"))

def read(file):
    """
    This method takes in a file as an argument and opens the file in read mode. 
    It then reads the contents of the file and returns them.
    """
    with open(file, "r") as f:
        contents = f.read()
    return contents

print(read("example.txt"))
```
