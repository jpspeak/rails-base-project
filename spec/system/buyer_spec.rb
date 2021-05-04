require 'rails_helper'
describe 'buyer creation and features', type: :system do
  it 'registers' do
    visit root_path
    click_on('Register')
    fill_in('Email', with: 'user2@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_on('Sign up')
    click_on('Sign out')
  end

  it 'sign in and buy stock' do
    create(:buyer)
    create(:broker, :confirmed, :approved)
    create(:stock)
    visit new_buyer_session_path
    fill_in('Email', with: 'buyer1@gmail.com')
    fill_in('Password', with: '123456')
    click_on('Log in')
    click_on('Buy Stock')
    click_on('broker1@gmail.com')
    click_on('TestCompany')
    fill_in('Enter quantity', with: '10')
    click_on('BUY')
    click_on('Transactions')
    expect(page).to have_selector 'td', text: 'BABA'
    click_on('Sign out')
  end
end
