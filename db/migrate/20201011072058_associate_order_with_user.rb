class AssociateOrderWithUser < ActiveRecord::Migration[6.0]
  def up
    change_table :orders do |t|
      t.references :user, index: true, foreign_key: true
    end
  end

  def down
    change_table :orders do |t|
      t.remove_references :user, index: true, foreign_key: true
    end
  end
end
