# Implement to get the converted value from the real-time currency conversion service

## Description

We need to implement a service that has the amount of a specific currency, or the service can convert the amount from a currency to
another. The recommended services are not the best option at this moment, because the convert endpoint is premium (I need to pay to use), and the 
unique free endpoint you need to pass which currencies you would like to convert one unit of the base currency, but I need to be premium to 
change the base currency param. Looking for options on the internet, I've found [ExchangeRate](https://api.exchangerate.host), this one is free 
and has the option to convert the amount from a currency to another instead of just giving the value of the currency.

The ExchangeRate receives some params, but we can care about of fourth of them:

- from: the base currency
- to: the target currency
- amount: the value of the from currency
- places: the total of numbers after the comma.

So, we need to do a GET to https://api.exchangerate.host/convert passing this args above to receive the converted amount.

## Trade-Offs

- This is a free API, I don't have an API key, the site doesn't specify how many requests I can do, there isn't a doc with the possible errors 
that can happen. So I can't do a great error handling here.

- The API has the endpoint to convert the amount, I don't need to create a logic to get the amount and times it to get the amount specified by 
the user.

## Definition of Done

* A module that can do an external request to get the converted amount and return a tuple with:
- {:error, reason}
- {:ok, data}. In this data, we would like to have: the base and target currency, the base amount, and the converted amount