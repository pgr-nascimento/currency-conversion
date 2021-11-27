# User convert currencies

## Context

As a user of the application, when I give a value from a currency that I want to convert (base currency) to another currency (target currency),
I want to see the value from the base currency converted to the target currency.

So, for example, If I passed 10 EUR to USD, I want to see 12.10 USD.


## Definition of Done

- Do a request to the endpoint `GET /api/currency/:from/convert/:to?amount=:amount` and received an JSON response:

```JSON
GET /api/currency/brl/convert/usd?amount=10
{
    base_currency: "EUR",
    target_currency: "USD",
    amount: "10",
    result: "12.10",
    text: "10 EUR -> 12.10 USD"
}
```

## Tasks

1. Setup an account to get an API key in one of the services of "real-time" currency conversion there are some options on the Links session.
2. Implement to get the converted value from the real-time currency conversion service
3. Create an endpoint to request the converted value


## Links

- https://fixer.io/
- https://exchangeratesapi.io  
- https://ratesapi.io  