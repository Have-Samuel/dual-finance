class CreateRecurringBills < ActiveRecord::Migration[8.1]
  def change
    create_table :recurring_bills do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :amount_cents
      t.integer :due_day
      t.integer :status
      t.string :avatar

      t.timestamps
    end
  end
end
