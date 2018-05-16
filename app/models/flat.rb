class Flat < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :reservations
  validates :title, presence: true
  validates :title, length: {minimum: 2, maximum: 120}, allow_blank: true
  validates :description, presence: true
  validates :price, presence: true
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  validates :capacity, presence: true
  validates_numericality_of :capacity, :greater_than_or_equal_to => 0
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, inclusion: { in: (Date.today..Date.new(2119,2,3)) }
  validates :end_date, inclusion: { in: (Date.today..Date.new(2119,2,3)) }

end

