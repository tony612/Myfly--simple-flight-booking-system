class CreateFlightInfos < ActiveRecord::Migration
  def change
    create_table :flight_infos do |t|
      t.string :airline, :null => false
      t.string :flightno, :null => false
      t.string :planetype, :null => false
      t.datetime :leavetime, :null => false
      t.string :leavecity, :null => false
      t.datetime :arrivetime, :null => false
      t.string :arrivecity, :null => false
      t.text :remark

      t.timestamps
    end
  end
end
