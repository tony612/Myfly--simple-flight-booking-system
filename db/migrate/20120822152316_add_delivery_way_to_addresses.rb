class AddDeliveryWayToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :delivery_way, :string
  end
end
