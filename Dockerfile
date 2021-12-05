FROM elixir:1.11.4

WORKDIR /app
COPY mix.exs /app/
COPY mix.lock /app/

RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get \
    && mix deps.compile

ADD . /app

RUN mix compile