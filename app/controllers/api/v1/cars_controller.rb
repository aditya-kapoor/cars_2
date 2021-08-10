class Api::V1::CarsController < Api::V1::GraphitiController
  def index
    cars = CarResource.all(params)
    respond_with(cars)
  end

  def show
    car = CarResource.find(params)
    respond_with(car)
  end

  def create
    car = CarResource.build(params)

    if car.save
      render jsonapi: car, status: :created
    else
      render jsonapi_errors: car
    end
  end

  def update
    car = CarResource.find(params)

    if car.update_attributes
      render jsonapi: car
    else
      render jsonapi_errors: car
    end
  end

  def destroy
    car = CarResource.find(params)

    if car.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: car
    end
  end
end
