class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :table
      t.integer :number
      t.text :occasion
      t.text :date
      t.text :time
      t.text :duration

      t.timestamps
    end
  end
end
