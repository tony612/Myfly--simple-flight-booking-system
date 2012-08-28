class DeliverPay < ActiveRecord::Base
  attr_accessible :deliver_way, :order_id, :pay_way, :remark
  has_one :address, :dependent => :destroy, :inverse_of => :deliver_pay

  attr_accessible :address_id
  def address_id
    self.address.try :id
  end

  def address_id=(id)
    self.address = Address.find_by_id(id)
  end

  belongs_to :order, :inverse_of => :deliver_pay
end
