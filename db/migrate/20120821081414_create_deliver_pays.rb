class CreateDeliverPays < ActiveRecord::Migration
  def change
    create_table :deliver_pays do |t|
      t.string :pay_way, :null => false
      t.string :deliver_way, :null => false
      t.integer :order_id, :null => false
      t.integer :deliver_address_id, :null => false
      t.text :remark

      t.timestamps
    end
  end
end
