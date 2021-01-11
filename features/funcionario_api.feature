#language: pt

Funcionalidade: Gerenciamento de funcionários via API

  Cenário: Cadastrar funcionário
    Dado que eu crie um funcinário
    Então obterei um resposta de sucesso
  
  Cenário: Listar funcionário cadastrado
    Dado que eu crie um funcinário
    E solicite as informacões dele
    Então obterei o funcionário que cadastrei com sucesso
    E ele será igual ao solicitado

  Cenário: Listar todos os funcionários
    Dado que liste todos os funcionários cadastrados
    Então obterei a lista com sucesso

  Cenário: Alterar funcionário
    Dado que eu crie um funcinário
    E solicite as informacões dele
    Quando altero os dados do meu funcionário cadastro
    Então o funcionário terá dados que utilizei pra alterar
