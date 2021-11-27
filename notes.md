Hello, dear reviewer! I hope you are great. As you don't have contact with me to discuss and elaborate the solution, I thought using this file to share with you my thoughts, dilemmas, and everything that I believe could be important to help you in your code review. I hope you enjoy your reading.

## Where do I start? 

I've started creating a new project with `mix phx.new currency_conversion --no-html --no-webpack --no-dashboard --no-ecto`, because it is an API and we won't need the frontend part of Phoenix, as this project it's a code challenge and didn't go to prod, I opted to remove the Dashboard too and Ecto I removed because my solution won't use it.

My first challenge is related to the route that I need to create. I want to create a REST endpoint, as we have 3 variables that we need to receive from the user: base currency, target currency, and amount. I was wondering about:

- To create using `GET /api/currency/:from/convert/:to?value=10.01` 
- To create using `GET /api/currency/convert?from=BRL&to=USD&amount=30`
- To create using `POST /api/currency/convert`
```
{
    from:  BRL,
    to:    USD,
    value: 10.41 
}
```

As the application won't create anything, POST doesn't look like a good option (although passing the values in the body instead of in the URL looks good to me), I'm hanging to choose the first option, but I will ask some people more experienced than me before took the decision.

## About the flows of the application

### Thinking about the happy path

1. User request informing the base and target currency and the amount
2. The application receives the data
3. The application validates the data (check if both currencies exist)
4. The application requests a real-time conversion service
5. The application manages the received data (e.g the result value was 30.19231, it's good if we change it to 30.19)
6. The application shows the data to the user


### Corner Cases that I could imagine

* The user informs a wrong base currency
* The user informs a wrong target currency
* The user didn't inform a value
* The user informs a wrong value (a word, for example)
* The user informs the same currencies.
* The application reaches the limit of requests to the real-time conversion service.
* The real-time conversion service doesn't respond.

## The board folder

I work better when I can see where I need to put my efforts, to assist me and give an idea of progress, I've created the board folder to "simulate" Trello or Jira. The idea is to create histories and tasks for me to handle and to know what I need to do, next steps. In past code challenges that I did, I lost a lot of time because I don't write my thoughts in an organized way. 