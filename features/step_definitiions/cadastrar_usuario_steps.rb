Dado('que acesso o site inmrobo.tk') do
  @home_page = HomePage.new
  @home_page.load
end

Dado('acesso a tela de cadastro de usuário') do
  @home_page = HomePage.new
  @home_page.register_link.click
end

Quando('preencho os dados do usuário') do
  user = { email: Faker::Internet.email, password: '123mudar', password_confirmation: '123mudar' }
  @sign_up_page = SignUpPage.new
  @sign_up_page.register_user(user)
end

Quando('confirmo cadastro do usuário') do
  @sign_up_page = SignUpPage.new
  @sign_up_page.register_button.click
end

Entao('sou redirecionado para tela de login') do
  expect(page).to have_current_path('http://www.inmrobo.tk/accounts/login/')
end

Entao('os inputs estarão com alerta de erro') do
  @sign_up_page = SignUpPage.new
  expect(@sign_up_page.input_errors.length).to eq(3)
end
