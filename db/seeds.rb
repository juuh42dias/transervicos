# frozen_string_literal: true

require 'net/http'
require 'json'

# Areas e Subareas
areas = {
  "Saúde": [
    'Odontologia', 'Cirurgia Plástica', 'Urologia', 'Ginecologia', 'Endocrinologia', 'Dermatologia', 'Cirurgia Geral',
    'Infectologia', 'Proctologia'
  ],
  "Direito": ['Advocacia'],
  "Educação": ['Preparatório Pré-Vestibular', 'Ensino Médio', 'Ensino Fundamental', 'Ensino Superior', 'Idioma'],
  "Religião": [],
  "Comidas": [],
  "Beleza": [],
  "Eventos": [],
  "Moda": ['Costura'],
  "Higiene": ['Limpeza'],
  "Atendimento ao público": [],
  "Alimentação": [],
  "Tecnologia": []
}

areas.each do |area_name, subareas|
  area_exists = Area.find_by(area: area_name)
  next unless !Area.all.exists? || !area_exists

  area = Area.create(area: area_name)
  subareas.each { |subarea_name| Subarea.create(subarea: subarea_name, area_id: area.id) }
  Subarea.create(subarea: 'Outro', area_id: area.id)
end

unless Area.find_by(area: 'Outro')
  area = Area.create(area: 'Outro')
  Subarea.create(subarea: 'Outro', area_id: area.id)
end

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.githubusercontent.com', 443)
    http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
  end

  def self.capital?(city, state)
    city['name'] == state['capital']
  end

  def self.populate
    states.each do |state|
      state_obj = State.new(acronym: state['acronym'], name: state['name'])
      state_obj.save

      state['cities'].each do |city|
        c = City.new
        c.name = city['name']
        c.state = state_obj
        c.save
      end
    end
  end
end

BRPopulate.populate
