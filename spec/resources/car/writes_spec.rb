require 'rails_helper'

RSpec.describe CarResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'cars',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CarResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Car.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:car) { create(:car) }

    let(:payload) do
      {
        data: {
          id: car.id.to_s,
          type: 'cars',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CarResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { car.reload.updated_at }
      # .and change { car.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:car) { create(:car) }

    let(:instance) do
      CarResource.find(id: car.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Car.count }.by(-1)
    end
  end
end
