class ChangeIii261TypeToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    change_column :questionnaires, :iii_26_1, :text
  end
end
