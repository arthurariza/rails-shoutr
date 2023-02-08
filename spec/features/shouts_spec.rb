require 'rails_helper'

RSpec.feature 'Shouts', type: :feature do
  scenario 'guest user cannnot shout' do
    visit '/'

    fill_in 'shout_content_body', with: 'Test Shout'
    click_button 'Create Shout'

    expect(page).to have_text('You need to sign in or sign up before continuing.')
  end

  scenario 'logged in user can shout' do
    user = create(:user)

    sign_in user

    visit '/'

    fill_in 'shout_content_body', with: 'Test Shout'
    click_button 'Create Shout'

    expect(page).to have_text('Shout Created!')
  end

  scenario 'shout content cannot be empty' do
    user = create(:user)

    sign_in user

    visit '/'

    click_button 'Create Shout'

    expect(page).to have_text('Content is invalid')
  end
end
