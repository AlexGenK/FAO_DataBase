class AddIvColumnsToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :iv_3_4, :text
    add_column :questionnaires, :iv_4_4, :text
    add_column :questionnaires, :iv_5_4, :text
    add_column :questionnaires, :iv_6_5, :text
    add_column :questionnaires, :iv_9_4, :text
    add_column :questionnaires, :iv_10_5, :text
    add_column :questionnaires, :iv_11_1, :boolean
    add_column :questionnaires, :iv_11_2, :boolean
    add_column :questionnaires, :iv_11_3, :boolean
    add_column :questionnaires, :iv_11_4, :text
  end
end
