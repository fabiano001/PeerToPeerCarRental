class CarPicturesController < ApplicationController
  before_action :set_car_picture, only: [:show, :edit, :update, :destroy]

  # GET /car_pictures
  # GET /car_pictures.json
  def index
    @car_pictures = CarPicture.all
  end

  # GET /car_pictures/1
  # GET /car_pictures/1.json
  def show
  end

  # GET /car_pictures/new
  def new
    @car_picture = CarPicture.new
  end

  # GET /car_pictures/1/edit
  def edit
  end

  # POST /car_pictures
  # POST /car_pictures.json
  def create
    @car_picture = CarPicture.new(car_picture_params)

    respond_to do |format|
      if @car_picture.save
        format.html { redirect_to @car_picture, notice: 'Car picture was successfully created.' }
        format.json { render :show, status: :created, location: @car_picture }
      else
        format.html { render :new }
        format.json { render json: @car_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_pictures/1
  # PATCH/PUT /car_pictures/1.json
  def update
    respond_to do |format|
      if @car_picture.update(car_picture_params)
        format.html { redirect_to @car_picture, notice: 'Car picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_picture }
      else
        format.html { render :edit }
        format.json { render json: @car_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_pictures/1
  # DELETE /car_pictures/1.json
  def destroy
    @car_picture.destroy
    respond_to do |format|
      format.html { redirect_to car_pictures_url, notice: 'Car picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_picture
      @car_picture = CarPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_picture_params
      params.require(:car_picture).permit(:path)
    end
end
