# Currency Conversion

This application was made as part of Tiltify's hiring process.

In this API application, you can convert an amount from a currency to another.

## How to use

### Convert Endpoint

*Request params*

`from`:   The three-letter currency code you would like to convert from.
`to`:     The three-letter currency code you would like to convert to.
`amount`: The amount to be converted.

*API Request* 

```
GET /api/convert
    ? from = USD
    & to = BRL
    & amount = 10
```

*API Response* 

```JSON
{
  "base_currency": "USD",
  "target_currency": "BRL",
  "base_amount": 10,
  "converted_amount": 40.13,
  "message": "10 USD -> 40.13 BRL"
}

``` 

## What was used
- [Elixir](https://github.com/elixir-lang/elixir) the main language
- [Phoenix](https://github.com/phoenixframework/phoenix) is the framework that uses elixir to create WebApplication
- [Credo](https://github.com/rrrene/credo) to analyze the code and suggest good practices.


## Setting up the projectz

**IMPORTANT** Make sure you have [Docker](https://docs.docker.com/engine/install/ubuntu/) and [Docker Compose](https://docs.docker.com/compose/install/) first.

``` 
# You may need to install dependencies first
$ docker-compose run --rm app mix deps.get

# Running client and server application
$ docker-compose up
```

## Running the tests

`$ docker-compose run -e MIX_ENV=test --rm app mix test`
