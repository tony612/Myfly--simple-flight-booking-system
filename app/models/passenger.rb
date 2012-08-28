class Passenger < ActiveRecord::Base
  attr_accessible :accident_number, :cred_number, :cred_type, :delay_number, :name, :order_id
  validates :cred_type, :cred_number, :name, presence: true
  belongs_to :order, :inverse_of => :passengers
end
