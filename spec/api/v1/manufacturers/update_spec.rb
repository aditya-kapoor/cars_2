require 'rails_helper'

RSpec.describe "manufacturers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/manufacturers/#{manufacturer.id}", payload
  end

  describe 'basic update' do
    let!(:manufacturer) { create(:manufacturer) }

    let(:payload) do
      {
        data: {
          id: manufacturer.id.to_s,
          type: 'manufacturers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ManufacturerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { manufacturer.reload.attributes }
    end
  end
end
