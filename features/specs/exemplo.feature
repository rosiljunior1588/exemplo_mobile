#language:pt

Funcionalidade: Nome da Funcionalidade

   Espaco para uma descricao

## As tags servem para execuções especificas, no caso podemos optar por executar apenas a @tag1 no fluxo.

@tag1
Cenário: Exemplo de Cenário

Dado que estou na tela X
Quando eu pressionar o botão Y
Então será apresentado a mensagem Z

@tag2
Esquema do Cenário: Exemplo de Esquema do cenário
## Esquema de Cenário serve para utilizar valores parametrizados no fluxo, podendo testar nesse caso abaixo
## Fluxo positivo e negativo.

Dado que estou na tela X
Quando eu informar o "<login>" e "<senha>" e pressionar o botão Y
Então será apresentado a mensagem "<Z>"

Exemplos:
| login     | senha    | Z                   |
| usuario_1 | senha_1  | Logado com sucesso  |
| usuario_1 | senha_2  | Senha incorreta     |
| usuario_2 | senha_2  | Usuário inexistente |