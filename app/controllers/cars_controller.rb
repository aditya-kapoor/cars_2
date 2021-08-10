class CarsController < ApplicationController
  before_action :current_user_must_be_car_user,
                only: %i[edit update destroy]

  before_action :set_car, only: %i[show edit update destroy]

  def index
    @q = Car.ransack(params[:q])
    @cars = @q.result(distinct: true).includes(:user,
                                               :manufacturer).page(params[:page]).per(10)
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = Car.new(car_params)

    if @car.save
      message = "Car was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @car, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: "Car was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    message = "Car was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to cars_url, notice: message
    end
  end

  private

  def current_user_must_be_car_user
    set_car
    unless current_user == @car.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:user_id, :manufacturer_id, :name)
  end
end
