# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @services = current_user.services
  end
end
