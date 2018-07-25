class AddUserToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :user, :string
  end
end
