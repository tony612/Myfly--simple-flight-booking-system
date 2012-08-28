class RenameFlightnoToFlightNo < ActiveRecord::Migration
  change_table :flights do |t|
    t.rename :flightno, :flight_no
    t.rename :planetype, :plane_type
    t.rename :leavetime, :leave_time
    t.rename :leavecity, :leave_city
    t.rename :arrivetime, :arrive_time
    t.rename :arrivecity, :arrive_city
    t.rename :cabinclass, :cabin_class
  end
end
