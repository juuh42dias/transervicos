# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(common_params + [:terms_of_service])
  end

  def account_update_params
    params.require(:user).permit(common_params + [:current_password])
  end

  def common_params
    %i[social_name civil_name birth_date username email
       phone_number password password_confirmation name_preference]
  end

  def after_update_path_for(_resource)
    dashboard_path
  end
end
