require 'rails_helper'
describe 'broker creation and features', type: :system do
  it 'registers' do
    visit new_broker_registration_path
    fill_in('Email', with: 'user2@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_on('Sign up')
  end

  it 'signs in and add stock' do
    create(:broker, :confirmed, :approved)
    visit new_broker_session_path
    fill_in('Email', with: 'broker1@gmail.com')
    fill_in('Password', with: '123456')
    click_on('Log in')
    click_on('Add Stock')
    fill_in('e.g., TSLA', with: 'TSLA')
    click_on('Search')
    click_on('Add')
    expect(page).to have_selector 'td', text: 'TSLA'
    click_on('Sign out')
  end
end
