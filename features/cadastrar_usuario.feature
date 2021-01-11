#language: pt

Funcionalidade: Cadastrar usuário
  Contexto:
    Dado que acesso o site inmrobo.tk
    E acesso a tela de cadastro de usuário

  Cenário: Fluxo básico de cadastro de usuário
    Quando preencho os dados do usuário
    E confirmo cadastro do usuário
    Então sou redirecionado para tela de login

  Cenário: Garantir que não possível cadastrar um usuário sem dados
    Quando confirmo cadastro do usuário
    Então os inputs estarão com alerta de erro
  