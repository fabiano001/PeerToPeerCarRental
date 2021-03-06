json.array!(@cars) do |car|
  json.extract! car, :id, :make, :model, :year, :car_type, :color, :body_type, :engine_type, :transmission, :audio_input, :bluetooth, :heated_seats, :sun_roof, :rearview_camera, :gps, :air_conditioner, :electric_doors, :electric_seats, :condition, :video, :description, :latitude, :longitude, :price, :address, :city, :state, :driven_wheels, :vehichle_size, :fuel_type, :antilock_brake_system
  json.url car_url(car, format: :json)
end
