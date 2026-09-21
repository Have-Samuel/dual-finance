class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :recipient
      t.string :avatar
      t.integer :amount_cent
      t.integer :direction
      t.date :occurred_on

      t.timestamps
    end
  end
end
