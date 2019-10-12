# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor visit root path' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_css('header#main-header img[src*=transervicos-logo]')
    expect(page).to have_link('cadastre-se', href: new_user_registration_path)
    expect(page).to have_link('busque serviço', href: services_path)
  end
end
