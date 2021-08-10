require "rails_helper"

RSpec.describe "cars#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/cars/#{car.id}", payload
  end

  describe "basic update" do
    let!(:car) { create(:car) }

    let(:payload) do
      {
        data: {
          id: car.id.to_s,
          type: "cars",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CarResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { car.reload.attributes }
    end
  end
end
