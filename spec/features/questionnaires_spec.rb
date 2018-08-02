require "rails_helper"

feature 'Work with questionnaires', type: :feature do
  before do
    @quest_list = create_list(:questionnaire, 5)
    visit root_path
    click_link 'FAO questionnaires database'
  end

  context 'when User is logged in' do
    before do
      @user=create(:simple_user)
      click_link 'Log In'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    scenario 'User can view full index of questionnaires' do
      expect(page).to have_questionnaires_in_quantity 5
      @quest_list.each {|quest| expect(page).to have_content(quest.fio, count: 1)}
    end

    scenario 'User can add questionnaire' do
      click_link 'Создать новую анкету'
      fill_in('ФИО ребенка', with: 'Johnny Mnemonic')
      fill_in('Код', with: 999)
      click_button 'Сохранить анкету'
      expect(page).to have_questionnaires_in_quantity 6
      expect(page).to have_content 'Johnny Mnemonic'
    end

    scenario 'User can delete questionnaire' do
      click_on(class: 'btn-outline-danger', match: :first)
      expect(page).to have_questionnaires_in_quantity 4
    end

    scenario 'User can edit questionnaire' do
      expect(page).not_to have_content 'Molly Millions'
      click_link @quest_list[0].fio
      fill_in('ФИО ребенка', with: 'Molly Millions')
      click_button 'Сохранить анкету'
      expect(page).to have_content 'Molly Millions'
      expect(page).to have_questionnaires_in_quantity 5
    end

    scenario 'User can find questionnaire by FIO' do
      fill_in('search', with: @quest_list[1].fio)
      click_button 'Найти'
      expect(page).to have_questionnaires_in_quantity 1
      expect(page).to have_content(@quest_list[1].fio, count: 1)
      click_button 'Показать все'
      expect(page).to have_questionnaires_in_quantity 5
    end

    scenario 'User can find questionnaire by code' do
      fill_in('search', with: @quest_list[2].code)
      click_button 'Найти'
      expect(page).to have_questionnaires_in_quantity 1
      expect(page).to have_content(@quest_list[2].fio, count: 1)
      click_button 'Показать все'
      expect(page).to have_questionnaires_in_quantity 5
    end
  end

  context 'when User is not logged in' do
    scenario 'User can view shorted index of questionnaires' do
      expect(page).to have_questionnaires_in_quantity 5
      expect(page).to have_content('???????', count: 5)
    end

    scenario 'User can not add questionnaire' do
      click_link 'Создать новую анкету'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario 'User can not delete questionnaire' do
      click_on(class: 'btn-outline-danger', match: :first)
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario 'User can not edit questionnaire' do
      click_on('???????', match: :first)
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario 'User can find questionnaire by code' do
      fill_in('search', with: @quest_list[2].code)
      click_button 'Найти'
      expect(page).to have_questionnaires_in_quantity 1
      expect(page).to have_content("??????? #{@quest_list[2].code}" , count: 1)
      click_button 'Показать все'
      expect(page).to have_questionnaires_in_quantity 5
    end
  end
end
