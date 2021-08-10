require 'rails_helper'

RSpec.describe "manufacturers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/manufacturers", params: params
  end

  describe 'basic fetch' do
    let!(:manufacturer1) { create(:manufacturer) }
    let!(:manufacturer2) { create(:manufacturer) }

    it 'works' do
      expect(ManufacturerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['manufacturers'])
      expect(d.map(&:id)).to match_array([manufacturer1.id, manufacturer2.id])
    end
  end
end
