class CreateFlightDeliverPays < ActiveRecord::Migration
  def change
    create_table :flight_deliver_pays do |t|
      t.integer :flight_id
      t.integer :deliver_pay_id

      t.timestamps
    end
  end
end
