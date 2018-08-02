class Questionnaire < ApplicationRecord
  validates :code, presence: true
  validates :code, uniqueness: true

  VISUAL_STRUCT = YAML.load_file('config/visual.yml')
end
