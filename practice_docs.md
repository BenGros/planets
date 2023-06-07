Documentation for Program 1:
    1. Purpose: The purpose of this program is to use the OpenAI API to get a response from chatGPT.
    2. Important Methods:
        - get_completion(prompt, model): This method takes a prompt and a model as input and returns a response from chatGPT. 
        - openai.ChatCompletion.create(model, messages): This method is used to create a chat completion with the specified model and messages.
    3. Method Explanation and Example:
        - get_completion(prompt, model): This method takes a prompt and a model as input and returns a response from chatGPT. Example: get_completion("Hello, how are you?", "chatGPT")
        - openai.ChatCompletion.create(model, messages): This method is used to create a chat completion with the specified model and messages. Example: openai.ChatCompletion.create("chatGPT", messages)

Documentation for Program 2:
    1. Purpose: The purpose of this program is to read the contents of a file.
    2. Important Methods:
        - read(file): This method takes in a file as an argument and reads its contents, which are then returned.
    3. Method Explanation and Example:
        - read(file): This method takes in a file as an argument and reads its contents, which are then returned. Example: read("example.txt")
