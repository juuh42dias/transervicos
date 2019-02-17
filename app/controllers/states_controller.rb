# frozen_string_literal: true

class StatesController < ApplicationController
  respond_to :json
  def show
    state = State.find(params[:id])
    respond_with(state.as_json(include: :cities))
  end
end
