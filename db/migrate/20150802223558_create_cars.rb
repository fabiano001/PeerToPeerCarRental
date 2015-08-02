class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :type
      t.string :color
      t.string :body_type
      t.string :engine_type
      t.string :transmission
      t.boolean :audio_input
      t.boolean :bluetooth
      t.boolean :heated_seats
      t.boolean :sun_roof
      t.boolean :rearview_camera
      t.boolean :gps
      t.boolean :air_conditioner
      t.boolean :electric_doors
      t.boolean :electric_seats
      t.string :condition
      t.string :video
      t.string :description
      t.integer :latitude
      t.integer :longitude
      t.integer :price
      t.string :address
      t.string :city
      t.string :state
      t.string :driven_wheels
      t.string :vehichle_size
      t.string :fuel_type
      t.boolean :antilock_brake_system

      t.timestamps null: false
    end
  end
end
