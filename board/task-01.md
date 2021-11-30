# Fixer.IO API Key

## Description

Setup an account to get an API key in one in Fixer.io and configure it on the application.

In the near future, is important remove the API key from the config file and put it on enviroment variables.

## Comments

This is the key generated: `4073344916d44278d7b1b860d2ff346b`, when the application call fixer.io, we need to put it on the query string like:
`?access_key=4073344916d44278d7b1b860d2ff346b`

Update: I've tried to use the **fixer.io**, but is very restricted for free users, I can't use the convert endpoint and the latest endpoint and I can't change the base currency because it is a premium feature. The same happened with **exchangeratesapi**, so, I looked for another option and I founded the **exchangerate.host**, this service is free and has everything that I need to complete the task-02. I'm keeping this for the document, but I needed to change the approach.