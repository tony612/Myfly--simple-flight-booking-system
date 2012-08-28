class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :contact_name, :null => false
      t.integer :contact_phone, :null => false
      t.string :contact_email, :null => false
      t.integer :print_time, :null => false
      t.integer :flight_id, :null => false
      t.text :remark

      t.timestamps
    end
  end
end
