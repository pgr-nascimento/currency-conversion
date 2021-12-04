# Create an endpoint to request the converted value

## Description

We need to create an endpoint that receives the currencies and the amount, calls the Currency Converter Service and shows the result to the user. The steps that can be important to follow:

1. Receive the currencies and the amount
2. Validate the currencies
3. Validate the amount
4.1 If the data is valid, call Currency Converter Service
4.2 Show the success message
4.2 If the data is invalid, show an error message.

## Definition of Done

* An endpoint that receives the from and to currencies and the amount and returns a message with the converted value or shows an error message if the inputs are invalids.

* Expected message:

```JSON
{
    "base_currency": "USD",
    "target_currency": "BRL",
    "base_amount": 10,
    "converted_amount": 50,
    "message": "10 USD -> 50 BRL"
}
``` 