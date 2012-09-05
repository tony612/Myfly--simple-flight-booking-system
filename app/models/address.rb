class Address < ActiveRecord::Base
  attr_accessible :area, :city, :phone, :postcode, :person, :province, :street, :time, :info, :delivery_way, :day, :get_time, :deliver_way_id, :day, :hour, :name

  has_many :flight_addresses, :dependent => :delete_all
  has_many :flights, :through => :flight_addresses

  belongs_to :deliver_pay, :inverse_of => :address


end
