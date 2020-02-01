FROM elixir:1.10-slim

RUN mkdir /app
WORKDIR /app

COPY mix.exs mix.lock ./

RUN mix local.hex --force && mix local.rebar --force && mix deps.get

COPY . .

CMD ['mix test']
