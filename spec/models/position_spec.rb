require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'è remota?' do

    it 'retorna "true" para vagas remota' do
      position = Position.new(remote: true)
      result= position.is_remote
      expect(result).to be_truthy
    end

    it 'retorna "false" para vagas remota' do
      position = Position.new(remote: false)
      result= position.is_remote
      expect(result).to be_falsey
    end
  end

  describe 'è de tempo intergral?' do

    it 'retorna "true" para vagas integrais' do
      position = Position.new(full_time: true)
      result= position.is_full_time
      expect(result).to be_truthy
    end

    it 'retorna "false" para vagas meia_periodo' do
      position = Position.new(full_time: false)
      result= position.is_full_time
      expect(result).to be_falsey
    end

  end
end
