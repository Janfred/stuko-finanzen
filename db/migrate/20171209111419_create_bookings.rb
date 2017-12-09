class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :amount_cents
      t.string :comment
      t.date :date
      t.references :budget_year, foreign_key: true
      t.references :financial_request, foreign_key: true

      t.timestamps
    end
  end
end
