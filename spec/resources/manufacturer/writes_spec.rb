require "rails_helper"

RSpec.describe ManufacturerResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "manufacturers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ManufacturerResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Manufacturer.count }.by(1)
    end
  end

  describe "updating" do
    let!(:manufacturer) { create(:manufacturer) }

    let(:payload) do
      {
        data: {
          id: manufacturer.id.to_s,
          type: "manufacturers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ManufacturerResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { manufacturer.reload.updated_at }
      # .and change { manufacturer.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:manufacturer) { create(:manufacturer) }

    let(:instance) do
      ManufacturerResource.find(id: manufacturer.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Manufacturer.count }.by(-1)
    end
  end
end
