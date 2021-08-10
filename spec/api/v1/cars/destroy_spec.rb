require 'rails_helper'

RSpec.describe "cars#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/cars/#{car.id}"
  end

  describe 'basic destroy' do
    let!(:car) { create(:car) }

    it 'updates the resource' do
      expect(CarResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Car.count }.by(-1)
      expect { car.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
