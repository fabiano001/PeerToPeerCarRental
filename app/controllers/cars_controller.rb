class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action(:admin_only, :only => [:destroy])

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all

    if params[:make]
        @cars = @cars.where(make: params[:make])
    end
    if params[:model]
      @cars = @cars.where(model: params[:model])
    end
    if params[:car_type]
      @cars = @cars.where(car_type: params[:car_type])
    end
    if params[:bodytype]
      @cars = @cars.where(type: params[:body_type])
    end
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  def create

    @car = Car.new(car_params)
    @car.user_id = current_user.id;

    if(@car.save)
      flash[:notice] = "Your car listing is now available"
      redirect_to(@car)
    else
      puts("errors occurred creating new car")
      flash[:alert] = "Please address the following errors"
      @errors = @car.errors.full_messages
      @car = Car.new
      render("new")
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:make, :model, :year, :car_type, :color, :body_type, :engine_type, 
        :transmission, :audio_input, :bluetooth, :heated_seats, :sun_roof, :rearview_camera, :gps, 
        :air_conditioner, :electric_doors, :electric_seats, :condition, :video, :description, :latitude, 
        :longitude, :price, :address, :city, :state, :driven_wheels, :vehichle_size, :fuel_type, 
        :antilock_brake_system, avatars: [])
    end
end