class CreateBudgetYears < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_years do |t|
      t.string :name
      t.integer :budget_cents
      t.integer :additional_budget_cents

      t.timestamps
    end
  end
end
