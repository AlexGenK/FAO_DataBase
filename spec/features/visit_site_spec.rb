require "rails_helper"

feature 'Homepage', type: :feature do
  scenario 'User visits the site' do
    visit root_path
    expect(page).to have_content 'Sorry! Site under construction'
  end
end
