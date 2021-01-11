class EmployeesPage < SitePrism::Page
  set_url 'http://www.inmrobo.tk/empregados/'

  element :delete_button, '#delete-btn'
  element :edit_button, '#tabela > tbody > tr > td:nth-child(6) > a:nth-child(2) > button'
  element :table, '#tabela'
  element :search_field, '#tabela_filter > label > input[type=search]'
  element :new_employee_link, '#navbarSupportedContent > ul > li:nth-child(2) > a'
  element :success_container, '.alert.alert-success'

  def success_message
    success_container.text(:all)
  end

  def filter_user(cpf)
    search_field.set cpf
  end
end
