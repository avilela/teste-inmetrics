class NewEmployeePage < SitePrism::Page
  set_url 'http://www.inmrobo.tk/empregados/new_empregado'

  element :name_field, '#inputNome'
  element :role_field, '#inputCargo'
  element :cpf_field, '#cpf'
  element :salary_field, '#dinheiro'
  element :admission_field, '#inputAdmissao'
  element :gender_dropdown, '#slctSexo'
  element :clt_radio_buttom, '#clt'
  element :pj_radio_buttom, '#pj'
  element :submit_button, 'input[type="submit"].cadastrar-form-btn'

  def register_new_employee(employee)
    name_field.set employee['name']
    role_field.set employee['role']
    cpf_field.set employee['cpf']
    salary_field.set employee['salary']
    admission_field.set employee['admission']
    gender_dropdown.select(employee['gender'])
  end

  def select_work_regime(work_regime)
    if work_regime == 'clt'
      clt_radio_buttom.click
    else
      pj_radio_buttom.click
    end
  end
end
