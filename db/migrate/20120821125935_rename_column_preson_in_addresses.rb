class RenameColumnPresonInAddresses < ActiveRecord::Migration
  def change
    rename_column :addresses, :preson, :person
  end
end
