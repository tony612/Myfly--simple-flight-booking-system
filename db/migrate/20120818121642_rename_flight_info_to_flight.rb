class RenameFlightInfoToFlight < ActiveRecord::Migration
  def change
    rename_table :flight_infos, :flights
  end
end
