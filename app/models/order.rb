class Order < ApplicationRecord
  belongs_to :user
  validates :item, presence: true
  validates :quantity, presence: true
  validates :address, presence: true
end
