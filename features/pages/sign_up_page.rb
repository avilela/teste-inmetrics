class SignUpPage < SitePrism::Page
  set_url 'http://www.inmrobo.tk/accounts/signup/'

  element :user_field, 'form > div:nth-child(4) > input'
  element :password_field, 'form > div:nth-child(6) > input'
  element :password_confirmation_field, 'form > div:nth-child(8) > input'
  element :register_button, 'form > div.container-login100-form-btn.m-t-17 > button'
  elements :input_errors, 'form > .alert-validate'

  def register_user(user)
    user_field.set user[:email]
    password_field.set user[:password]
    password_confirmation_field.set user[:password_confirmation]
  end
end
