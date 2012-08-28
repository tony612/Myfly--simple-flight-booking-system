class RemoveColumnFromDeliverPays < ActiveRecord::Migration
  def up
    remove_column :deliver_pays, :deliver_address_id
  end

  def down
    add_column :deliver_pays, :deliver_address_id, :integer
  end
end
