ChatGPT Documentation
====================

This documentation provides an overview of the `ChatGPT` code, including its main method, usage instructions, and a tutorial.

Introduction
------------

The `ChatGPT` code utilizes OpenAI's GPT-3.5 Turbo model to generate responses to user prompts. It leverages the OpenAI API for communication and provides a convenient method to interact with the model.

Installation
------------

Before using the `ChatGPT` code, you need to ensure that you have the necessary dependencies installed. Follow the steps below:

1. Install the OpenAI Python library:

   .. code-block:: bash

      pip install openai

Method
------

The `ChatGPT` code consists of a single method:

.. automethod:: get_completion

Usage
-----

To use the `ChatGPT` code, follow the steps below:

1. Set the OpenAI API key in your environment. This is required to authenticate your API requests. You can obtain your API key from the OpenAI website.

   .. code-block:: bash

      export OPENAI_API_KEY=<your-api-key>

2. Import the necessary libraries and set up the API key:

   .. code-block:: python

      import openai
      import os

      openai.api_key = os.environ["OPENAI_API_KEY"]

3. Call the `get_completion` method with your desired prompt:

   .. code-block:: python

      prompt = "Hello, how can I help you today?"
      response = get_completion(prompt)
      print(response)

Tutorial
--------

In this tutorial, we will demonstrate how to use the `ChatGPT` code to have a conversation with ChatGPT. Let's get started!

1. Import the necessary libraries and set up the API key:

   .. code-block:: python

      import openai
      import os

      openai.api_key = os.environ["OPENAI_API_KEY"]

2. Define a prompt to start the conversation:

   .. code-block:: python

      prompt = "Hello, how can I help you today?"

3. Call the `get_completion` method with the prompt and print the response:

   .. code-block:: python

      response = get_completion(prompt)
      print(response)

4. You can continue the conversation by providing additional prompts within a list of messages:

   .. code-block:: python

      prompt = "Hello, how can I help you today?"
      messages = [
          {"role": "user", "content": prompt},
          {"role": "assistant", "content": "I need assistance with a programming problem."},
          {"role": "user", "content": "Sure, what's the problem?"},
      ]
      response = get_completion(messages)
      print(response)

Feel free to modify the prompts and messages to have a dynamic conversation with ChatGPT!

And that's it! You now know how to use the `ChatGPT` code to have interactive conversations with ChatGPT.

Please note that the usage of the code and the OpenAI API is subject to OpenAI's terms and conditions.

I hope this documentation helps you understand and utilize the `ChatGPT` code effectively.
