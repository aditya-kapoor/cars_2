require 'rails_helper'

RSpec.describe CarResource, type: :resource do
  describe 'serialization' do
    let!(:car) { create(:car) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(car.id)
      expect(data.jsonapi_type).to eq('cars')
    end
  end

  describe 'filtering' do
    let!(:car1) { create(:car) }
    let!(:car2) { create(:car) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: car2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([car2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:car1) { create(:car) }
      let!(:car2) { create(:car) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            car1.id,
            car2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            car2.id,
            car1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
