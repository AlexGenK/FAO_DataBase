class AddCategoryToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :category, :text
  end
end
