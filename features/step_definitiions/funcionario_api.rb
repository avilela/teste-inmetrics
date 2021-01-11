Dado('que eu crie um funcinário') do
  @request_helper = RequestHelper.new
  work_regime = %w[clt pj].sample
  gender = %w[m f i].sample
  salary = %w[1.000,00 1.500,00 2.500,00 3.500,00 4.500,00].sample
  @employee = {
    'admissao' => Faker::Date.between(from: '2019-12-1', to: '2021-01-10').strftime('%d/%m/%Y'),
    'cargo' => Faker::Job.title,
    'comissao' => '1.000,00',
    'cpf' => Faker::CPF.pretty,
    'departamentoId' => 1,
    'nome' => Faker::Name.name,
    'salario' => salary,
    'sexo' => gender,
    'tipoContratacao' => work_regime
  }.to_json
  @response = @request_helper.register_employee(@employee)
end

Dado('solicite as informacões dele') do
  @request_helper = RequestHelper.new
  @received_user = JSON.parse(@response.body)
  @check_registered_user_response = @request_helper.request_employee(@received_user['empregadoId'])
  @registered_user = JSON.parse(@check_registered_user_response.body)
end

Dado('que liste todos os funcionários cadastrados') do
  @request_helper = RequestHelper.new
  @all_users = @request_helper.request_all_users
end

Quando('altero os dados do meu funcionário cadastro') do
  @request_helper = RequestHelper.new
  work_regime = %w[clt pj].sample
  gender = %w[m f i].sample
  salary = %w[1.000,00 1.500,00 2.500,00 3.500,00 4.500,00].sample
  @employee_new_data = {
    'admissao' => Faker::Date.between(from: '2019-12-1', to: '2021-01-10').strftime('%d/%m/%Y'),
    'cargo' => Faker::Job.title,
    'comissao' => '1.000,00',
    'cpf' => Faker::CPF.pretty,
    'departamentoId' => 1,
    'nome' => Faker::Name.name,
    'salario' => salary,
    'sexo' => gender,
    'tipoContratacao' => work_regime
  }
  @updated_user_response = @request_helper.update_employee(
    @employee_new_data.to_json, @received_user['empregadoId']
  )
  @employee_new_data['empregadoId'] = @received_user['empregadoId']
  @employee_new_data.delete('departamentoId')
end

Entao('obterei um resposta de sucesso') do
  expect(@response.code).to eq(202)
end

Entao('obterei o funcionário que cadastrei com sucesso') do
  expect(@check_registered_user_response.code).to eq(202)
end

Entao('ele será igual ao solicitado') do
  expect(@received_user).to eq(@registered_user)
end

Entao('obterei a lista com sucesso') do
  all_users_content = JSON.parse(@all_users.body)
  expect(@all_users.code).to eq(200)
  expect(all_users_content.class).to eq(Array)
end

Entao('o funcionário terá dados que utilizei pra alterar') do
  user_data = JSON.parse(@updated_user_response.body)
  expect(@updated_user_response.code).to eq(202)
  expect(@employee_new_data).to eq(user_data)
end
