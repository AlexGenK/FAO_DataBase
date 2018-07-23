require "rails_helper"

feature 'Work with questionnaires', type: :feature do
  before do
    @quest_list = create_list(:questionnaire, 5)
    visit root_path
    click_link 'FAO questionnaires database'
  end

  scenario 'User can view index of questionnaires' do
    expect(page).to have_content('Список анкет (всего 5 шт.)')
    expect(page).to have_xpath('//tbody/tr', count: 5)
  end

  scenario 'User can add questionnaire' do
    click_link 'Создать новую анкету'
    fill_in('ФИО ребенка', with: 'Johnny Mnemonic')
    fill_in('Код', with: 999)
    click_button 'Сохранить анкету'
    expect(page).to have_content('Список анкет (всего 6 шт.)')
    expect(page).to have_content('Johnny Mnemonic')
    expect(page).to have_xpath('//*/tbody/tr', count: 6)
  end

  scenario 'User can delete questionnaire' do
    click_on(class: 'btn-outline-danger', match: :first)
    expect(page).to have_content('Список анкет (всего 4 шт.)')
    expect(page).to have_xpath('//*/tbody/tr', count: 4)
  end

  scenario 'User can edit questionnaire' do
    expect(page).not_to have_content('Molly Millions')
    click_link @quest_list[0].fio
    fill_in('ФИО ребенка', with: 'Molly Millions')
    click_button 'Сохранить анкету'
    expect(page).to have_content('Molly Millions')
    expect(page).to have_content('Список анкет (всего 5 шт.)')
  end
end
