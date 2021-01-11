class HomePage < SitePrism::Page
  set_url 'http://www.inmrobo.tk/accounts/login/'

  element :register_link, '#navbarSupportedContent > ul > li:nth-child(1) > a'
  element :user_field, 'input[type="text"]'
  element :password_field, 'input[type="password"]'
  element :login_buttton, '.login100-form-btn'
  element :error_container, '.alert.alert-danger.alert-dismissible.fade.show'

  def login(user)
    user_field.set user['email']
    password_field.set user['password']
    login_buttton.click
  end

  def text_error
    error_container.text(:all)
  end
end
