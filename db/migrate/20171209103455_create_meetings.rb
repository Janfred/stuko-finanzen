class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.date :date
      t.references :budget_year, foreign_key: true

      t.timestamps
    end
  end
end
