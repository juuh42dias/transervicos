# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor create an account' do
  scenario 'successfully' do
    visit root_path
    click_on 'cadastre-se'
    fill_in 'Nome', with: 'Austin Smith'
    fill_in 'Data de nascimento', with: '01/01/1980'
    fill_in 'Senha', with: '12345678'
    fill_in 'Senha (confirmação)', with: '12345678'
    fill_in 'Endereço de e-mail', with: 'austin@email.com'
    check 'Aceito os termos de uso'
    click_on 'Cadastrar'

    expect(page).to have_css('h1.panel-title', text: 'Olá, Austin Smith')
    expect(page).to have_css('div.sem-servicos p',
                             text: 'Você ainda não cadastrou nenhum serviço.')
    expect(page).to have_link('Cadastre o primeiro!', href: new_service_path)
  end

  scenario 'and should be older than 18' do
    birth_date = 17.years.ago.strftime('%d/%m/%Y')
    visit root_path
    click_on 'cadastre-se'
    fill_in 'Nome', with: 'Austin Smith'
    fill_in 'Data de nascimento', with: birth_date
    fill_in 'Senha', with: '12345678'
    fill_in 'Senha (confirmação)', with: '12345678'
    fill_in 'Endereço de e-mail', with: 'austin@email.com'
    check 'Aceito os termos de uso'
    click_on 'Cadastrar'

    expect(page).to have_content('É preciso ser maior de idade')
  end
end
