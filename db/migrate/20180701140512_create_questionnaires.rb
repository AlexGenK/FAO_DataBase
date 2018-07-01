class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :fio
      t.integer :code
      t.string :sex
      t.integer :age_years
      t.integer :age_months
      t.string :place
      t.integer :graduate
      t.integer :weight
      t.integer :height
      t.integer :bmi
      t.boolean :abdominal_pain
      t.boolean :headache
      t.boolean :concentration
      t.boolean :fatigability
      t.string :average_score

      t.timestamps
    end
  end
end
