class AddPriceToFlightInfos < ActiveRecord::Migration
  def change
    add_column :flight_infos, :price, :integer
    add_column :flight_infos, :class, :string
  end
end
