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

## Next Steps

For now, I believe the application delivers what it is proposed to do if we think about this like an MVP product. But improvements could be made to improve it and let the application more robust.

1. Has one or more fallback APIs to call.
We are using a free API, we don't have the reliability this API will work 100% of the time, we don't have any information about the error that 
could happen (there isn't documentation about it) and I believe if we add one or more APIs like to fall back the main API can be a good option.

With it in mind some improvements could be made to improve the code, like:

* Create an APIClient module: if we had more than one API, we will start having more than one HTTPoison reference in the application.
The APIClient would be the only module responsible to do the external requests and the API modules responsible to know about the endpoint, the
params, and how to return the values.

* Create an intelligent switch: with more than one API implemented, we can be thinking about:
- Wow, what about having a test A/B to check how API is better for us
- If we need to change the main API we will do this for all customers at once? A feature rollout starts being relevant to us.
- If we are almost reaching the request limit of an API, the application could recognize it and change it for the other API. This can save us to
save good money, for instance.

2. Identify who are requesting our service

This can be an important feature if we would like to know better about our customers, how many requests each one does: for day/week/month... Or 
if we would like to restrict the API for some reason, free users just could call 100 times for an hour (for instance). If we identify who is 
requesting the API this kind of demand will be more simplest with we just accept permitted customers to do the requests.