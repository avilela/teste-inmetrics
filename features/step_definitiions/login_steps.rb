Dado('que acesse com usuário válido') do
  @home_page = HomePage.new
  @home_page.login(@data['user'])
end

Dado('que acesse com usuário inválido') do
  user = { 'email' => Faker::Internet.email, 'password' => Faker::Alphanumeric.alpha(number: 6) }
  @home_page = HomePage.new
  @home_page.login(user)
end

Entao('sou redirecionado para tela de empregados') do
  expect(page).to have_current_path('http://www.inmrobo.tk/empregados/')
end

Entao('é exibida mensagem de erro') do
  @home_page = HomePage.new
  error_message = @home_page.text_error.gsub(' ×', '')
  expect(error_message).to eq('ERRO! Usuário ou Senha inválidos')
end
