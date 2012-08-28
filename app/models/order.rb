class Order < ActiveRecord::Base
  attr_accessible :contact_email, :contact_name, :contact_phone, :flight_id, :print_time, :remark, :passengers_attributes
  validates :contact_email, :contact_name, :contact_phone, :flight_id, :print_time, presence: true
  
  belongs_to :flight
  
  has_many :passengers, :dependent => :destroy, :inverse_of => :order
  accepts_nested_attributes_for :passengers, :allow_destroy => true
  attr_accessible :passengers_attributes, :allow_destroy => true
  
  has_one :deliver_pay, :dependent => :destroy, :inverse_of => :order
  attr_accessible :deliver_pay_attributes
  accepts_nested_attributes_for :deliver_pay, :allow_destroy => true
end
