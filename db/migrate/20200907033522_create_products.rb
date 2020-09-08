class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                       null: false
      t.text :content,                      null: false
      t.integer :category_id,               null: false
      t.integer :products_condition_id,     null: false
      t.integer :shipping_id,               null: false
      t.integer :delivery_fee_id,           null: false
      t.integer :delivery_day_id,           null: false
      t.integer :price,                     null: false
      t.integer :user_id,                   null: false, foreign_key: true
      t.timestamps
    end
  end
end
