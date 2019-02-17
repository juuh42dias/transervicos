# frozen_string_literal: true

class CityValidator < ActiveModel::Validator
  REQUIRED_MESSAGE = 'deve ser selecionada'
  FAIL_MESSAGE = 'não existe'

  def validate(model)
    if model.city_id.blank?
      model.errors[:city_id] << REQUIRED_MESSAGE
    else
      model.errors[:city_id] << FAIL_MESSAGE unless City.exists?(model.city_id)
    end
  end
end
