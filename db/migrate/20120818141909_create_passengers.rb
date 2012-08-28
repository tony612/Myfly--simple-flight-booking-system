class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name, :null => false
      t.string :cred_type, :null => false
      t.string :cred_number, :null => false
      t.integer :accident_number
      t.integer :delay_number
      t.integer :order_id, :null => false

      t.timestamps
    end
  end
end
