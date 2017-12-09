class CreateFinancialRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_requests do |t|
      t.string :name
      t.string :applicant
      t.integer :requested_sum
      t.date :date
      t.boolean :done
      t.string :agenda_item
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
