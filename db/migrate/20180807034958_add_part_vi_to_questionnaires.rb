class AddPartViToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :vi_1_1, :boolean
    add_column :questionnaires, :vi_1_2, :boolean
    add_column :questionnaires, :vi_1_3, :boolean
    add_column :questionnaires, :vi_1_4, :boolean
    add_column :questionnaires, :vi_1_5, :boolean
    add_column :questionnaires, :vi_1_6, :boolean
    add_column :questionnaires, :vi_2_1, :boolean
    add_column :questionnaires, :vi_2_2, :boolean
    add_column :questionnaires, :vi_2_3, :boolean
    add_column :questionnaires, :vi_2_4, :boolean
    add_column :questionnaires, :vi_3_1, :boolean
    add_column :questionnaires, :vi_3_2, :boolean
    add_column :questionnaires, :vi_3_3, :boolean
    add_column :questionnaires, :vi_3_4, :boolean
    add_column :questionnaires, :vi_4_1, :boolean
    add_column :questionnaires, :vi_4_2, :boolean
    add_column :questionnaires, :vi_4_3, :boolean
    add_column :questionnaires, :vi_4_4, :text
    add_column :questionnaires, :vi_5_1, :boolean
    add_column :questionnaires, :vi_5_2, :boolean
    add_column :questionnaires, :vi_5_3, :boolean
    add_column :questionnaires, :vi_5_4, :text
    add_column :questionnaires, :vi_6_1, :boolean
    add_column :questionnaires, :vi_6_2, :boolean
    add_column :questionnaires, :vi_6_3, :boolean
    add_column :questionnaires, :vi_6_4, :text
    add_column :questionnaires, :vi_7_1, :boolean
    add_column :questionnaires, :vi_7_2, :boolean
    add_column :questionnaires, :vi_7_3, :boolean
    add_column :questionnaires, :vi_7_4, :text
  end
end
