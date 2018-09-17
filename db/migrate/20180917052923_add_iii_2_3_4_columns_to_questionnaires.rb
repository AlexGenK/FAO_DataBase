class AddIii234ColumnsToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :iii_2_1, :text
    add_column :questionnaires, :iii_3_1, :text
    add_column :questionnaires, :iii_4_1, :text
  end
end
