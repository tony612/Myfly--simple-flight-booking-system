class RenameFlightDeliverPaysToFlightAdress < ActiveRecord::Migration
  def change
    rename_table :flight_deliver_pays, :flight_addresses
  end
end
