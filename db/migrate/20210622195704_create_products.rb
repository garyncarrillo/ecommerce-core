class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.decimal :price, null: false
      t.decimal :weight, null: false

      t.timestamps
    end
  end
end
