class RenameClassToFlightInfos < ActiveRecord::Migration
  def change
    rename_column :flight_infos, :class, :cabinclass
  end
end
