json.array!(@cars) do |car|
  json.extract! car, :id, :make, :model, :year, :type, :color, :body_type, :engine_type, :transmission, :audio_input, :bluetooth, :heated_seats, :sun_roof, :four_wheel_drive, :rearview_camera, :gps, :air_conditioner, :electric_doors, :electric_seats, :condition, :video, :description, :latitude, :longitude
  json.url car_url(car, format: :json)
end
