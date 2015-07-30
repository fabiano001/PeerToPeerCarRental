class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.datetime :start_date
      t.integer :duration
      t.integer :daily_price
      t.integer :total_price
      t.boolean :payment_processed

      t.timestamps null: false
    end
  end
end
