require "rails_helper"

RSpec.describe "manufacturers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/manufacturers/#{manufacturer.id}", params: params
  end

  describe "basic fetch" do
    let!(:manufacturer) { create(:manufacturer) }

    it "works" do
      expect(ManufacturerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("manufacturers")
      expect(d.id).to eq(manufacturer.id)
    end
  end
end
