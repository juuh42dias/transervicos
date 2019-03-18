# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :services, path: 'servicos' do
      member do
        put 'like', to: 'services#upvote'
        put 'dislike', to: 'services#downvote'
      end
    end
  end

  get 'dashboard', to: 'dashboard#index'

  get 'state/:id', to: 'states#show', format: 'json'

  get 'area/:area_id/subareas', to: 'application#load_subareas', as: 'subareas', format: :json

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'welcome#index'

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unacceptable', via: :all
  match '/500', to: 'errors#internal_error', via: :all

  post 'reports', to: 'reports#create', as: 'report'
  match 'list/services_with_reports', to: 'lists#services_with_reports', via: :all
  get 'reports/:service_id', to: 'reports#find_reports_by_service', as: 'reports_by_service'
end
