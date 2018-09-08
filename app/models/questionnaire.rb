class Questionnaire < ApplicationRecord
  validates :code, presence: true
  validates :code, uniqueness: true

  VISUAL_STRUCT = YAML.load_file('config/visual.yml')
  EDUCATION = { 1 => '1 класс', 
                2 => '2 класс',
                3 => '3 класс',
                4 => '4 класс',
                5 => '5 класс',
                6 => '6 класс',
                7 => '7 класс',
                8 => '8 класс',
                9 => '9 класс',
                10 => '10 класс',
                11 => '11 класс',
                100 => 'Школа',
                101 => 'Проф. училище',
                102 => 'Техникум',
                103 => 'Институт',
                104 => 'Аспирантура' }
end
