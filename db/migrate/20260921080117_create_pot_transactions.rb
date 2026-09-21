class CreatePotTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :pot_transactions do |t|
      t.references :pot, null: false, foreign_key: true
      t.integer :amount_cents
      t.date :transacted_on

      t.timestamps
    end
  end
end
