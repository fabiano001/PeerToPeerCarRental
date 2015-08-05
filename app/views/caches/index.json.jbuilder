json.array!(@caches) do |cach|
  json.extract! cach, :id, :search_results
  json.url cach_url(cach, format: :json)
end
