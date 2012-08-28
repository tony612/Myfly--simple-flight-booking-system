class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :province
      t.string :city
      t.string :street
      t.string :area
      t.string :preson
      t.integer :postcode
      t.string :phone
      t.string :time
      t.string :info

      t.timestamps
    end
  end
end
