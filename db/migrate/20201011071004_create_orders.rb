class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :item
      t.string :quantity
      t.text :address

      t.timestamps
    end
  end
end
