# Frame Circle API 🟢

Projeto **Frame Circle API** para o desafio técnico da empresa [Avantsoft](https://avantsoft.com.br/). Todo o projeto foi desenvolvido na framework **Ruby on Rails**, que disponibiliza uma API seguindo um padr'ao RESTFul.

A API fornece recursos para a criação e gerenciamento de quadros e círculos dentro do mesmo.

**Versão:** 1.0.0
**Link para Execução:** localhost:3000

---

## Indíce
- [Instalação](#instalação)
- [Acesso ao Projeto e Documentação de API](#acesso-ao-projeto-e-documentação-de-api)
- [Testes](#testes)
- [Endpoints](#endpoints)
    - [Frame](#frame)
    - [Circle](#circle)

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

## Acesso ao Projeto e Documentação de API

Todos os endpoints da API estão documentados e podem ser executados pelo Swagger/OpenAPI.

Para gerar a documentação da API (Swagger/OpenAPI):
```sh
docker compose exec frame_circle_api-api bundle exec rake rswag:specs:swaggerize
```

Com a documentação gerada, acessar:
```
http://localhost:3000/api-docs/index.html
```

E a página será exibida com todos os endpoints da API disponíveis para requisição e consulta da documentação

---

## Testes

A API possui testes automatizados para todas as Models e para todas as Controllers, com testes de Controller integrados com o Swagger/OpenAPI.

Para rodar os testes do RSpec:

Rodando todos os testes do projeto:
```sh
docker compose exec frame_circle_api-api rspec
```

Rodando os testes de um arquivo específico:
```sh
docker compose exec frame_circle_api-api rspec NOME_DO_ARQUIVO_DE_TESTE
```

Rodando os testes de um arquivo específico a partir de uma linha específica:
```sh
docker compose exec frame_circle_api-api rspec NOME_DO_ARQUIVO_DE_TESTE:NUMERO_DA_LINHA
```

---

## Modelagem

Na modelagem da aplicação foram criadas os seguintes modelos:

### Frame
- **center_x**: Campo com o valor no eixo X para o centro de um Quadro (Frame)
- **center_y**: Campo com o valor no eixo Y para o centro de um Quadro (Frame)
- **width**: Campo com o valor da largura do Quadro (Frame)
- **height**: Campo com o valor da altura do Quadro (Frame)

### Circle
- **center_x**: Campo com o valor no eixo X para o centro de um Círculo (Circle)
- **center_y**: Campo com o valor no eixo Y para o centro de um Círculo (Circle)
- **diameter**: Campo com o valor do diametro do Círculo (Circle)
- **frame_id**: Campo com o ID do Quadro (Frame) que o Círculo (Circle) pertence

---

## Endpoints

A API possui endpoints para os recursos de Frame e Circle.

### Frame

#### POST /frames
Endpoint que cria um novo quadro, recebendo a posição, a altura e a largura. Pode receber vários círculos para serem criados juntos em um mesmo quadro. 

##### Retorno
- Em caso de sucesso retorna o status `201 CREATED`.
- Em caso de falha retorna o status `422 UNPROCESSABLE ENTITY`.

#### GET /frames/:id
Endpoint que retorna detalhes de um quadro e seus círculos, como posição X, posição Y, total de círculo dentro do quadro, posição círculo que está na posição mais alta, na posição mais baixa, na posição mais à esquerda e na posição mais à direita.

##### Retorno
- Em caso de sucesso retorna o status `200 OK`.
- Em caso de não encontrar o recurso retorna o status `404 NOT FOUND`.

#### DELETE /frames/:id
Endpoint que remove um quadro. Só remove o quadro caso ele não possua círculos dentro.

##### Retorno
- Em caso de sucesso retorna o status `204 NO CONTENT`.
- Em caso de não encontrar o recurso retorna o status `404 NOT FOUND`.
- Em caso de falha retorna o status `422 UNPROCESSABLE ENTITY`.

### Circle

#### POST /frames/:id/circles
Endpoint que adiciona um novo círculo a um quadro específico.

##### Retorno
- Em caso de sucesso retorna o status `201 CREATED`.
- Em caso de não encontrar o recurso retorna o status `404 NOT FOUND`.
- Em caso de falha retorna o status `422 UNPROCESSABLE ENTITY`.

#### PUT /circles/:id
Endpoint que atualiza a posição de um círculo existente.

##### Retorno
- Em caso de sucesso retorna o status `200 OK`.
- Em caso de não encontrar o recurso retorna o status `404 NOT FOUND`.
- Em caso de falha retorna o status `422 UNPROCESSABLE ENTITY`.

#### GET /circles/:id
Endpoint que lista todos os círculos completamente dentro de um raio especificado a partir do ponto central informado. Pode também filtrar opcionalmente por Frames.

##### Retorno
- Em caso de sucesso retorna o status `200 OK`.

##### Parâmetros de Query
- center_x (number)
- center_y (number)
- radius (number)
- frame_id (integer)

#### DELETE /circles/:id
Endpoint que remove um círculo.

##### Retorno
- Em caso de sucesso retorna o status `204 NO CONTENT`.
- Em caso de não encontrar o recurso retorna o status `404 NOT FOUND`.