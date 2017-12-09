class CreateBudgetYears < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_years do |t|
      t.string :name
      t.integer :budget
      t.integer :additional_budget

      t.timestamps
    end
  end
end
