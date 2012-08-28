class Flight < ActiveRecord::Base
  attr_accessible :airline, :arrive_city, :arrive_time, :flight_no, :leave_city, :leave_time, :plane_type, :remark, :price, :cabin_class
  validates :airline, :arrive_city, :flight_no, :leave_city, :plane_type, :price, :cabin_class, presence: true
  validates :leave_time, :format => {:with => /\d\d\/\d\d\/\d\d\d\d/, :message => "Should be format dd/mm/yyyy"}
  has_many :orders, :dependent => :destroy, :inverse_of => :flight
  accepts_nested_attributes_for :orders, :allow_destroy => true
  attr_accessible :orders_attributes, :allow_destroy => true
  
  has_many :flight_addresses, :dependent => :delete_all, :autosave => true, :include => :address
  has_many :addresses, :through => :flight_addresses
  
  attr_accessible :address_ids
  
  #def address_ids=(ids)
   # unless (ids = ids.map(&:to_i).select{|i|i>0}) == (current_ids = flight_addresses.map(&:address_id))
    #  (current_ids - ids).each { |id| flight_addresses.select{|b|b.address_id == id}.first.mark_for_destruction }
     # self.addresss = ids.each_with_index.map do |id, index|
      #  if current_ids.include?(id)
       #   (address_association = flight_addresses.select{|b|b.address_id == id}.first).position = (index+1)
        #  address_association
       # else
        #  flight_addresses.build({:address_id => id, :position => (index+1)})
       # end
  #    end.map(&:address)
   # end
 # end

end
