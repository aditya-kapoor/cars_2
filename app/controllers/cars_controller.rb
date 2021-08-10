class CarsController < ApplicationController
  before_action :current_user_must_be_car_user, only: [:edit, :update, :destroy] 

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars
  def index
    @cars = Car.page(params[:page]).per(10)
  end

  # GET /cars/1
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      message = 'Car was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @car, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    message = "Car was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to cars_url, notice: message
    end
  end


  private

  def current_user_must_be_car_user
    set_car
    unless current_user == @car.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:user_id, :manufacturer_id)
    end
end
