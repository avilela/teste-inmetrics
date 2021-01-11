class RequestHelper
  def initialize
    data = YAML.safe_load(File.read('./features/support/config/config.yaml'))
    @base_url = 'https://inm-api-test.herokuapp.com'
    @auth = {
      username: data['api_user']['username'],
      password: data['api_user']['password']
    }
    @headers = { 'Content-Type' => 'application/json' }
  end

  def register_employee(body)
    url = "#{@base_url}/empregado/cadastrar"
    HTTParty.post(
      url,
      body: body,
      basic_auth: @auth,
      headers: @headers
    )
  end

  def request_employee(id)
    url = "#{@base_url}/empregado/list/#{id}"
    HTTParty.get(
      url,
      basic_auth: @auth
    )
  end

  def request_all_users
    url = "#{@base_url}/empregado/list_all"
    HTTParty.get(
      url,
      basic_auth: @auth
    )
  end

  def update_employee(body, id)
    url = "#{@base_url}/empregado/alterar/#{id}"
    HTTParty.put(
      url,
      body: body,
      basic_auth: @auth,
      headers: @headers
    )
  end
end
