class CreatePots < ActiveRecord::Migration[8.1]
  def change
    create_table :pots do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :target_cents
      t.string :color

      t.timestamps
    end
  end
end
