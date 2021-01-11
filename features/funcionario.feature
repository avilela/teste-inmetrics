#language: pt

Funcionalidade: Gerenciamento de funcionários

  Contexto:
    Dado que acesso o site inmrobo.tk
    E que acesse com usuário válido

  Cenário: Criar funcionário
    Quando clico no botão de adicionar funcionário
    E preencho os dados do novo funcionário
    Então será exibida mensagem de sucesso de cadastro de funcionário

  Cenário: Editar funcionário já cadastrado
    Quando clico no botão de adicionar funcionário
    E preencho os dados do novo funcionário
    E filtro o usuário já cadastrado
    E clico para abrir a tela de edição
    E modifico o usuário
    Então será exibida mensagem de edição com sucesso

  Cenário: Deletar usuário já cadastrado
    Quando clico no botão de adicionar funcionário
    E preencho os dados do novo funcionário
    E filtro o usuário já cadastrado
    E clico para deletar o usuário
    
