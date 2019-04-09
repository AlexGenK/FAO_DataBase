FactoryBot.define do
  factory :questionnaire, class: Questionnaire do
    sequence(:fio) { |n| "John Doe #{n}" }
    sequence(:code) { |n| n }
    sex { "M" }
    age_years { 10 }
    age_months { 128 }
    place { "City" }
    graduate { 4 }
    weight { 36 }
    height { 128 }
    bmi { 10 }
    abdominal_pain { false }
    headache { false }
    concentration { true }
    fatigability { false }
    average_score { "5-8" }
    user { "simple_user@mail.no" }
  end
end
