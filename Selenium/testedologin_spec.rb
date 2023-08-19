# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'Testedologin' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'testedologin' do
    @driver.get('http://localhost:3000/users/sign_in')
    @driver.manage.resize_to(1936, 1048)
    @driver.find_element(:id, 'user_email').click
    @driver.find_element(:id, 'user_email').send_keys('user@gmail.com')
    @driver.find_element(:id, 'user_password').click
    @driver.find_element(:id, 'user_password').send_keys('123456')
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:link_text, 'Minha Empresa').click
    @driver.find_element(:link_text, 'Minhas vagas').click
    @driver.find_element(:link_text, 'Publicar Vaga').click
    @driver.find_element(:link_text, 'Início').click
    @driver.find_element(:link_text, 'Ver mais').click
  end
end
