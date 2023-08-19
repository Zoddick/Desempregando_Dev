require 'csv'

class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position

  validates :name, :email, :phone, presence: true

# Método para calcular a idade com base na data de nascimento (birthdate)
def calculate_age
  return if brithday.nil?

  now = Time.now.utc.to_date
  dob = self.brithday.to_date
  age = now.year - dob.year
  age -= 1 if now.month < dob.month || (now.month == dob.month && now.day < dob.day)
  return age
end


  def verifica_idade
    idade = self.calculate_age
    if (idade <=13)
      return "menor"
    elsif(idade > 13 && idade < 18)
      return "aprendiz"
    else
      return "efetivo"
    end
  end
end

