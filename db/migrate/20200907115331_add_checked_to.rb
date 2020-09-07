class AddCheckedTo < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :checked, :boolean
  end
end
