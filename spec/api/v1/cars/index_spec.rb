require "rails_helper"

RSpec.describe "cars#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cars", params: params
  end

  describe "basic fetch" do
    let!(:car1) { create(:car) }
    let!(:car2) { create(:car) }

    it "works" do
      expect(CarResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["cars"])
      expect(d.map(&:id)).to match_array([car1.id, car2.id])
    end
  end
end
