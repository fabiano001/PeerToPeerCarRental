json.array!(@rentals) do |rental|
  json.extract! rental, :id, :start_date, :duration, :daily_price, :total_price, :payment_processed
  json.url rental_url(rental, format: :json)
end
