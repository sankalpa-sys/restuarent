class Book < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :time, presence: true
  validates :number, presence: true
  validates :duration, presence: true
end
