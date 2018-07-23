require "rails_helper"

feature 'User registration', type: :feature do
  before do
    visit root_path
  end

  context ' When user do not registered' do
    scenario 'User can signup' do
      click_link 'Log In'
      click_link 'Sign up'
      fill_in 'Email', with: build(:simple_user).email
      fill_in 'Password', with: build(:simple_user).password
      fill_in 'Password confirmation', with: build(:simple_user).password
      click_button 'Sign up'
      expect(page).to have_content "Current user: #{build(:simple_user).email}"
    end

    scenario 'User can login' do
      @user=create(:simple_user)
      click_link 'Log In'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_content "Current user: #{@user.email}"
    end
  end

  context 'When user is registered' do
    before do
      @user=create(:simple_user)
      click_link 'Log In'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    scenario 'User can logout' do
      expect(page).to have_content "Current user: #{@user.email}"
      click_link 'Log Out'
      expect(page).to_not have_content "Current user: #{@user.email}"
    end
  end
end
