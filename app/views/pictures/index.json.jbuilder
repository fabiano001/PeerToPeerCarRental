json.array!(@pictures) do |picture|
  json.extract! picture, :id, :path
  json.url picture_url(picture, format: :json)
end
