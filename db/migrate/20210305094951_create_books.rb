class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.decimal :number
      t.decimal :people
      t.datetime :datetime
      t.string :duration

      t.timestamps
    end
  end
end
