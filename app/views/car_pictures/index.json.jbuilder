json.array!(@car_pictures) do |car_picture|
  json.extract! car_picture, :id, :path
  json.url car_picture_url(car_picture, format: :json)
end
