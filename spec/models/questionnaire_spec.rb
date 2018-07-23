require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  subject { build(:questionnaire) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with empty code" do
    subject.code = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with not unique code" do
    create(:questionnaire, code: 99)
    subject.code = 99
    expect(subject).to_not be_valid
  end
end
