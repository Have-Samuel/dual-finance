class CreateBudgets < ActiveRecord::Migration[8.1]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :limit_cents
      t.string :color

      t.timestamps
    end
  end
end
