class AddDayToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :get_time, :datetime
  end
end
