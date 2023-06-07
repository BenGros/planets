import openai
import os
openai.api_key = os.environ["OPENAI_API_KEY"]

# this method gets an answer from chatGPT
def get_completion(prompt, model = "gpt-3.5-turbo"):
  messages = [{"role": "user", "content": prompt)]
  response = openai.ChatCompletion.create(
    model = model,
    messages = messages,
    temperature = 0,
  )
  return response.choices[0].message["content"]
