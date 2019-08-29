# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  NOT_ALLOWED_MESSAGE = 'Você não está autorizado a acessar esta página'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def load_subareas
    area = Area.find(params[:area_id])
    respond_to do |format|
      format.json { render json: area.subareas }
    end
  end

  rescue_from CanCan::AccessDenied do
    respond_to do |format|
      format.json { render nothing: true, status: :forbidden }
      format.html { redirect_to main_app.new_user_session_path, alert: NOT_ALLOWED_MESSAGE }
    end
  end
end
