class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: %i[show edit update destroy]

  def index
    @q = Manufacturer.ransack(params[:q])
    @manufacturers = @q.result(distinct: true).includes(:cars).page(params[:page]).per(10)
  end

  def show
    @car = Car.new
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit; end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      redirect_to @manufacturer,
                  notice: "Manufacturer was successfully created."
    else
      render :new
    end
  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to @manufacturer,
                  notice: "Manufacturer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @manufacturer.destroy
    redirect_to manufacturers_url,
                notice: "Manufacturer was successfully destroyed."
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
