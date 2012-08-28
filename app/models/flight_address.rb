class FlightAddress < ActiveRecord::Base
  attr_accessible :address_id, :flight_id

  belongs_to :flight
  belongs_to :address
end
