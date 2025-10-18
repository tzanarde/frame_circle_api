# syntax = docker/dockerfile:1

FROM ruby:3.4.5

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y postgresql-client

RUN bundle config --global frozen 1

# Criação do diretório de trabalho
WORKDIR /frame_circle_api

# Cópia dos arquivos e instalação das gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Rodar o arquivo de entrypoint para deletar o server.pid
COPY bin/docker-entrypoint /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]

# Escutar porta 3000 e rodar o servidor
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]