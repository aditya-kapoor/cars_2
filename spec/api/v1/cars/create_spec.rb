require 'rails_helper'

RSpec.describe "cars#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/cars", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'cars',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CarResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Car.count }.by(1)
    end
  end
end
