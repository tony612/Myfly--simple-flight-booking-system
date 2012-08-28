Flight.delete_all
Flight.transaction do
  (1..100).each do |i|
    seed = Random.new(i + 1234)
    city_begin = seed.rand(1..15)
    city_end = city_begin + 2
    day_begin = seed.rand(1..29)
    hour_begin = seed.rand(1..23)
    hour_end = (hour_begin + seed.rand(1..4)) % 23 + 1
    if hour_end > hour_begin then
      day_end = day_begin
    else
      day_end = day_begin + 1
    end
    minute_begin = seed.rand(1..59)
    minute_end = seed.rand(1..59)
    air_comp = ["CA1", "MU5", "ZH3", "CZ3", "WH2", "SZ4", "SF5", "WU1"]
    air_comp_index = seed.rand(0..(air_comp.count - 1))
    Flight.create(airline: "AirLine #{i % 10 + 1}", arrive_city: "City #{city_end}", 
                      arrive_time: DateTime.civil(2012,9,day_end,hour_end,minute_end,0), 
                      flight_no: air_comp[air_comp_index] + "#{seed.rand(100..999)}", 
                      leave_city: "City #{city_begin}", 
                      leave_time: DateTime.civil(2012,9,day_begin,hour_begin,minute_begin,0), 
                      plane_type: "PlaneType #{seed.rand(1..10)}", remark: "This is remark.",
                      price: seed.rand(400..1500), cabin_class: "eco")
  end
end
