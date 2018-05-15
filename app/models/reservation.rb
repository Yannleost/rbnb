class Reservation < ApplicationRecord
  belongs_to :flat
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  validates :start_date, presence: true # >= start_date du flat.
  validates :start_date, inclusion: { in: (Date.today..Date.new(2119,2,3)) }
  validates :end_date, presence: true # <= end_date du flat + > startdate resta
  validates :end_date, inclusion: { in: (Date.today..Date.new(2119,2,3)) }

end


