Quando('clico no botão de adicionar funcionário') do
  @employees_page = EmployeesPage.new
  @employees_page.new_employee_link.click
end

Quando('preencho os dados do novo funcionário') do
  @employees_page = NewEmployeePage.new
  work_regime = %w[clt pj].sample
  @employee = {
    'name' => Faker::Name.name,
    'role' => Faker::Job.title,
    'cpf' => Faker::CPF.pretty,
    'salary' => Faker::Number.decimal(l_digits: 3, r_digits: 2),
    'admission' => Faker::Date.between(from: '2019-12-1', to: '2021-01-10').strftime('%d/%m/%Y'),
    'gender' => 'Masculino',
    'work_regime' => work_regime
  }
  @employees_page.register_new_employee(@employee)
  @employees_page.select_work_regime(work_regime)
  @employees_page.submit_button.click
end

Quando('modifico o usuário') do
  @employees_page = NewEmployeePage.new
  work_regime = %w[clt pj].sample
  @employee = {
    'name' => Faker::Name.name,
    'role' => Faker::Job.title,
    'cpf' => Faker::CPF.pretty,
    'salary' => Faker::Number.decimal(l_digits: 3, r_digits: 2),
    'admission' => Faker::Date.between(from: '2019-12-1', to: '2021-01-10').strftime('%d/%m/%Y'),
    'gender' => 'Masculino',
    'work_regime' => work_regime
  }
  @employees_page.register_new_employee(@employee)
  @employees_page.select_work_regime(work_regime)
  @employees_page.submit_button.click
end

Entao('será exibida mensagem de sucesso de cadastro de funcionário') do
  @employees_page = EmployeesPage.new
  success_message = @employees_page.success_message.gsub(' ×', '')
  expect(success_message).to eq('SUCESSO! Usuário cadastrado com sucesso')
end

Entao('será exibida mensagem de edição com sucesso') do
  @employees_page = EmployeesPage.new
  success_message = @employees_page.success_message.gsub(' ×', '')
  expect(success_message).to eq('SUCESSO! Informações atualizadas com sucesso')
end

Entao('será exibida mensagem de deleção com sucesso') do
  @employees_page = EmployeesPage.new
  success_message = @employees_page.success_message.gsub(' ×', '')
  expect(success_message).to eq('SUCESSO! Funcionário removido com sucesso')
end

Quando('filtro o usuário já cadastrado') do
  @employees_page = EmployeesPage.new
  sleep 7
  @employees_page.filter_user @employee['cpf']
  sleep 5
end

Quando('clico para abrir a tela de edição') do
  @employees_page = EmployeesPage.new
  @employees_page.edit_button.click
end

Quando('clico para deletar o usuário') do
  @employees_page = EmployeesPage.new
  @employees_page.delete_button.click
end
