module ServicesHelper
  def save_service_text(service)
    service.persisted? ? 'Salvar alterações' : 'Cadastrar serviço'
  end

  def states_selector
    State.all.order(:name)
  end

  def should_display_owner_data(service)
    service.try(:owner_name).present?
  end

  def get_selected_subarea_id(service)
    service.subarea && service.subarea.area ? service.subarea.area.id : nil
  end

  def get_selected_subareas(service)
    service.subarea && service.subarea.area ? service.subarea.area.subareas : []
  end

  def read_selected_state_from_url
    params[:state][:state_id] if params[:state] && params[:state][:state_id].present?
  end

  def read_selected_city_from_url
    params[:city][:city_id] if params[:city] && params[:city][:city_id].present?
  end

  def user_voted_for?(service)
    voter = current_user || VotingSession.find_by(ip: request.remote_ip)
    voter && voter.voted_for?(service)
  end

  def user_voted_up_service?(service)
    voter = current_user || VotingSession.find_by(ip: request.remote_ip)
    voter && voter.voted_for?(service) && voter.voted_up_on?(service)
  end

  def user_voted_down_service?(service)
    voter = current_user || VotingSession.find_by(ip: request.remote_ip)
    voter && voter.voted_for?(service) && voter.voted_down_on?(service)
  end
end
