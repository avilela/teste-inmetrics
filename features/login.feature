#language: pt

Funcionalidade: Login no sistema

  Contexto:
    Dado que acesso o site inmrobo.tk
  
  Cenário: Validar que consigo acessar o sistema com usuário válidado
    E que acesse com usuário válido
    Então sou redirecionado para tela de empregados
  
  Cenário: Validar que não consigo logar com usuário inválido
    E que acesse com usuário inválido
    Então é exibida mensagem de erro