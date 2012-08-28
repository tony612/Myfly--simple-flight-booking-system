class RenameColumnDeliverPayIdToAddressId < ActiveRecord::Migration
  def change
    rename_column :flight_addresses, :deliver_pay_id, :address_id
  end
end
