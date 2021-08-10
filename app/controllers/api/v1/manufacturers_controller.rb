class Api::V1::ManufacturersController < Api::V1::GraphitiController
  def index
    manufacturers = ManufacturerResource.all(params)
    respond_with(manufacturers)
  end

  def show
    manufacturer = ManufacturerResource.find(params)
    respond_with(manufacturer)
  end

  def create
    manufacturer = ManufacturerResource.build(params)

    if manufacturer.save
      render jsonapi: manufacturer, status: 201
    else
      render jsonapi_errors: manufacturer
    end
  end

  def update
    manufacturer = ManufacturerResource.find(params)

    if manufacturer.update_attributes
      render jsonapi: manufacturer
    else
      render jsonapi_errors: manufacturer
    end
  end

  def destroy
    manufacturer = ManufacturerResource.find(params)

    if manufacturer.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: manufacturer
    end
  end
end
