FROM elixir:1.7.3

RUN mkdir /app
WORKDIR /app

RUN mix local.hex --force && mix local.rebar --force
RUN mix archive.install --force hex phx_new 1.4.0-rc.2

RUN apt-get update -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs postgresql-client inotify-tools

EXPOSE 4000
