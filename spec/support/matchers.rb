RSpec::Matchers.define :have_questionnaires_in_quantity do |quantity|
  match do |page|
    expect(page).to have_content "Список анкет (всего #{quantity} шт.)"
    expect(page).to have_xpath '//tbody/tr', count: quantity
  end
end
