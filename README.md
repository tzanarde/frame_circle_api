# Frame Circle API 🟢

Projeto **Frame Circle API** para o desafio técnico da empresa [Avantsoft](https://avantsoft.com.br/). Todo o projeto foi desenvolvido na framework **Ruby on Rails**, que disponibiliza uma API seguindo um padr'ao RESTFul.

A API fornece recursos para a criação e gerenciamento de quadros e círculos dentro do mesmo.

**Versão:** 1.0.0
**Link para Execução:** localhost:3000

---

## Indíce
- [Instalação](#instalação)
- [Testes](#testes)
- [Autenticação](#autenticação)
- [Modelos](#endpoints)
    - [Exemplo](#exemplo)

---

## Instalação

O projeto pode ser instalado a partir do Docker Compose.

1. Para construir as imagens dos containers:
```sh
docker compose build
```

2. Para iniciar os containers:
```sh
docker compose up
```
Opcionalmente, use a opção `-d` para iniciar em segundo plano.

Com isso, dois containers serão iniciados:
- `frame_circle_api-db`
- `frame_circle_api-api`

3. Para criação e migração do banco de dados, caso ainda não tenha feito:

```sh
docker compose exec frame_circle_api-api bin/rails db:create db:migrate
```

Com isso a API já poderá ser acessada pela sua URL padrão:

```sh
localhost:3000
```

---

## Testes

Para rodar os testes do RSpec:

```sh
docker compose exec frame_circle_api-api rspec
```

---

## Autenticação

---

## Modelagem
Na modelagem da aplicação foram criadas os seguintes modelos:

### Exemplo
Explicação:
- **Campo 1**: campo1

### Esquema da Modelagem
![]()

