class AddAddressColumnsToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :region, :text
    add_column :questionnaires, :address, :text
  end
end
