require 'capybara'
require 'capybara/cucumber'
require 'cpf_faker'
require 'faker'
require 'httparty'
require 'json'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
end
