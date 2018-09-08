class AddChildrenParamsToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :children_weight, :integer
    add_column :questionnaires, :children_height, :integer
    add_column :questionnaires, :children_bmi, :integer
  end
end
