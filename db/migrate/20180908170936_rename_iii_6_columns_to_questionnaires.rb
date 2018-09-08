class RenameIii6ColumnsToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    rename_column :questionnaires, :iii_6_1, :iii_7_1
    rename_column :questionnaires, :iii_6_2, :iii_7_2
    rename_column :questionnaires, :iii_6_3, :iii_7_3
    rename_column :questionnaires, :iii_6_4, :iii_7_4
  end
end
