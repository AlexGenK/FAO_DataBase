require "rails_helper"

feature 'User registration', type: :feature do
  before do
    visit root_path
  end

  context ' When user do not registered' do
    scenario 'User can signup' do
      click_link 'Войти'
      click_link 'Регистрация'
      fill_in 'Email', with: build(:simple_user).email
      fill_in 'Пароль', with: build(:simple_user).password
      fill_in 'Подтверждение пароля', with: build(:simple_user).password
      click_button 'Регистрация'
      expect(page).to have_content "Текущий пользователь: #{build(:simple_user).email}"
    end

    scenario 'User can login' do
      @user=create(:simple_user)
      click_link 'Войти'
      fill_in 'Email', with: @user.email
      fill_in 'Пароль', with: @user.password
      click_button 'Войти'
      expect(page).to have_content "Текущий пользователь: #{@user.email}"
    end
  end

  context 'When user is registered' do
    before do
      @user=create(:simple_user)
      click_link 'Войти'
      fill_in 'Email', with: @user.email
      fill_in 'Пароль', with: @user.password
      click_button 'Войти'
    end

    scenario 'User can logout' do
      expect(page).to have_content "Текущий пользователь: #{@user.email}"
      click_link 'Выйти'
      expect(page).to_not have_content "Текущий пользователь: #{@user.email}"
    end
  end
end
