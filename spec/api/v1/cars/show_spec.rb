require "rails_helper"

RSpec.describe "cars#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cars/#{car.id}", params: params
  end

  describe "basic fetch" do
    let!(:car) { create(:car) }

    it "works" do
      expect(CarResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("cars")
      expect(d.id).to eq(car.id)
    end
  end
end
