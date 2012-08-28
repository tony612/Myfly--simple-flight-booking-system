class RemoveColumnAddressIdToDeliveryPays < ActiveRecord::Migration
  def up
    remove_column :deliver_pays, :address_id
    add_column :addresses, :deliver_pay_id, :integer
  end

  def down
    add_column :deliver_pays, :address_id, :integer
    remove_column :addresses, :deliver_pay_id
  end
end
