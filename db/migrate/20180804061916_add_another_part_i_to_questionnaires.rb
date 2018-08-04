class AddAnotherPartIToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :i_17_1, :boolean
    add_column :questionnaires, :i_17_2, :boolean
    add_column :questionnaires, :i_17_3, :boolean
  end
end
