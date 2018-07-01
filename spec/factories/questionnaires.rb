FactoryBot.define do
  factory :questionnaire do
    fio "John Doe"
    code 12345
    sex "M"
    age_years 10
    age_months 128
    place "City"
    graduate 4
    weight 36
    height 128
    bmi 10
    abdominal_pain false
    headache false
    concentration true
    fatigability false
    average_score "5-8"
  end
end
