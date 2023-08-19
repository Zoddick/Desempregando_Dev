require 'rails_helper'

RSpec.describe UserPosition, type: :model do
  describe 'verifica_idade' do

    it 'retorna "Menor" para age menor que 13' do
      applicant= Applicant.new(brithday: "01/01/2010")
      result= applicant.verifica_idade
      expect(result).to eq('menor')
    end

    it 'retorna "aprendiz" para age entre 14 a 17' do
      applicant= Applicant.new(brithday: "01/01/2009")
      result= applicant.verifica_idade
      expect(result).to eq('aprendiz')
    end

    it 'retorna "aprendiz" para age entre 14 a 17' do
      applicant= Applicant.new(brithday: "01/01/2008")
      result= applicant.verifica_idade
      expect(result).to eq('aprendiz')
    end

    it 'retorna "aprendiz" para age entre 14 a 17' do
      applicant= Applicant.new(brithday: "01/01/2006")
      result= applicant.verifica_idade
      expect(result).to eq('aprendiz')
    end

    it 'retorna "efetivo" para age mmaior que 18' do
      applicant= Applicant.new(brithday: "01/01/2005")
      result= applicant.verifica_idade
      expect(result).to eq('efetivo')
    end

    it 'retorna "efetivo" para age mmaior que 18' do
      applicant= Applicant.new(brithday: "01/01/2004")
      result= applicant.verifica_idade
      expect(result).to eq('efetivo')
    end
  end
end
