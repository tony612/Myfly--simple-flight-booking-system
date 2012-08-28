class AddHourToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :hour, :string
    add_column :addresses, :day, :string
  end
end
