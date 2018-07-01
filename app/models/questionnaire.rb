class Questionnaire < ApplicationRecord
  validates :code, presence: true
  validates :code, uniqueness: true
end
