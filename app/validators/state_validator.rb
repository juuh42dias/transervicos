class StateValidator < ActiveModel::Validator
  REQUIRED_MESSAGE = 'deve ser selecionado'
  FAIL_MESSAGE = 'não existe'

  def validate(model)
    if model.state_id.blank?
      model.errors[:state_id] << REQUIRED_MESSAGE
    else
      model.errors[:state_id] << FAIL_MESSAGE unless State.exists?(model.state_id)
    end
  end
end
